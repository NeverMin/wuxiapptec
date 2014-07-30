#!/usr/bin/perl -w
# --
# znuny.otrs.AdminPrivilegeFixup.pl - return admin privileges to given user
# --
# $Id:$
# --
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# --

# use ../ as lib location
use File::Basename;
use FindBin qw($RealBin);
use lib dirname($RealBin);
use lib dirname($RealBin)."/Kernel/cpan-lib";

use strict;

use vars qw($VERSION);
$VERSION = '$Revision: 0.01 $';
$VERSION =~ s/^\$.*:\W(.*)\W.+?$/$1/;

use Kernel::Config;
use Kernel::System::Log;
use Kernel::System::DB;
use Kernel::System::User;
use Kernel::System::Group;

use Getopt::Long qw(:config no_ignore_case);

my $Debug = $ENV{OTRS_DEBUG} || 0;
$| = 1; # unbuffered output

use constant DEFAULT_USER => 'root at localhost';

# Name of this executable file
# (without directory and extensions)
my $ProgramName;
($ProgramName = $0) =~ s!.*/!!; # strip dir
$ProgramName =~ s!\.[^.]+$!!; # strip last ext

# --
# common objects
# --
my %CommonObject = ();
$CommonObject{ConfigObject} = Kernel::Config->new();
$CommonObject{LogObject} = Kernel::System::Log->new(
    LogPrefix => "OTRS-$ProgramName",
    %CommonObject,
);
$CommonObject{DBObject} = Kernel::System::DB->new(%CommonObject);
$CommonObject{UserObject} = Kernel::System::User->new(%CommonObject);
$CommonObject{GroupObject} = Kernel::System::Group->new(%CommonObject);
  
# preserve original args
my $args = join(' ', @ARGV);

my ($username, $password, $addprivs, $addgroup, $help);

# set default values
$username = DEFAULT_USER;

$args or usage();

# check args
GetOptions ('username|u=s'  => \$username,
	    'password|p=s'  => \$password,
	    'addprivs|a'    => \$addprivs,
	    'addgroup|g'    => \$addgroup,
            'help|h'        => \$help,
           )
  || die "Error in options (use --help)\n";

$help and usage();

my $userTable = $CommonObject{ConfigObject}->Get('DatabaseUserTable') || 'system_user';
my $userTable_UserID = $CommonObject{ConfigObject}->Get('DatabaseUserTableUserID') || 'id';
my $userTable_Login = $CommonObject{ConfigObject}->Get('DatabaseUserTableUser') || 'login';

die "Invalid characters in username!\n"
  if ($username and $username !~ /[-\.\w\@]+/);

# first - validate user if it was accidentally set invalid
my $SQL = "UPDATE $userTable SET valid_id = 1".
  " WHERE $userTable_UserID = 1 OR $userTable_Login = '$username'";

$CommonObject{DBObject}->Do(SQL => $SQL)
  or die "Failed to validate admin user record!\n";

# now get the admin user's data
my $user_id = $CommonObject{UserObject}->GetUserIdByName(
    User => $username,
);

if (! $user_id) {
  print STDERR "User '$username' not found in database!\n";
  
  # user not there -- insert it
  my %Param = (
      Firstname => 'Admin',
      Lastname  => 'OTRS',
      Login     => $username,
      Pw        => '/',
      ValidID   => 1,
      UserID    => 1,
      Email     => $username,
  );

  print STDERR "Inserting user '$username' record in database...\n";

  $user_id = $CommonObject{UserObject}->UserAdd(%Param);
  die "UserAdd failed!\n" if (! $user_id);

  print STDERR "  inserted under user_id = $user_id\n";

  # now set the user's id to 1
  $SQL = "DELETE FROM $userTable WHERE id = 1";
  $CommonObject{DBObject}->Do(SQL => $SQL)
    or die "Failed to delete old admin user record!\n";
  
  $SQL = "UPDATE $userTable SET $userTable_UserID = 1 WHERE $userTable_UserID = $user_id";
  $CommonObject{DBObject}->Do(SQL => $SQL)
    or die "Failed to reset admin user id to 1!\n";

  print STDERR "  replaced user_id = $user_id with user_id = 1\n";
  
  $user_id = 1;
}

# set password?
if ($password) {
  $CommonObject{UserObject}->SetPassword(
      UserLogin => $username, PW => $password
  )
     or die "Failed to set password for '$username'!\n";
  print STDERR "Changed password of user '$username'.\n";
}

my $group_id;

if ($addprivs) {
  # check admin group
  my %AdminGroup = GroupGet(\%CommonObject, Name => 'admin');
  if (scalar(keys(%AdminGroup))) {
    $group_id = $AdminGroup{ID};
  }
  else {
    if ($addgroup) {
      $group_id = $CommonObject{GroupObject}->GroupAdd(
	  Name => 'admin',
	  ValidID => 1,
	  UserID => $user_id,
      ) or die "Failed to add 'admin' group!\n";
    }
    else {
      die "Cannot retrieve data for admin group.\nUse --addgroup to fix that!\n";
    }
  }
  
#  # delete old privilege record
#  $SQL = "DELETE FROM group_user ".
#    " WHERE user_id = $user_id ".
#    " AND group_id = $group_id ".
#    " AND permission_key = 'rw' ";
#  $CommonObject{DBObject}->Do(SQL => $SQL)
#    or die "Failed to delete old permission record!\n";

  # recreate privilege record
  $CommonObject{GroupObject}->GroupMemberAdd(
     UID => $user_id,
     GID => $group_id,
     UserID => $user_id,
     Permission => { 'rw' => 1},
  )
    or die "Failed to add admin 'rw' permission to user '$username'!\n";
}

exit(0);

sub GroupGet {
    my $cObj = shift;
    
    my %Param = @_;
    # check needed stuff
    if (!$Param{Name} and !$Param{ID}) {
        $cObj->{LogObject}->Log(Priority => 'error', Message => "Need Group Name or ID!");
        return;
    }
    # db quote
    foreach (keys %Param) {
        $Param{$_} = $cObj->{DBObject}->Quote($Param{$_});
    }
    # sql
    my $where;
    if ($Param{ID}) {
       $where = " id = $Param{ID}";
       $Param{Name} = undef;
    }
    else {
      $where = " name = '$Param{Name}' ";
    }
    my $SQL = "SELECT id, name, valid_id, comments ".
        " FROM ".
        " groups ".
        " WHERE ".
        " $where";
    if ($cObj->{DBObject}->Prepare(SQL => $SQL)) {
        my %GroupData = ();
        while (my @Data = $cObj->{DBObject}->FetchrowArray()) {
            %GroupData = (
                ID => $Data[0],
                Name => $Data[1],
                Comment => $Data[3],
                ValidID => $Data[2],
            );
        }
        return %GroupData;
    }
    else {
        return;
    }
}



# --
# show usage 
# --
sub usage {
  print STDERR "
  $ProgramName -- OTRS - Admin Privilege Fixup Script

  usage: $ProgramName [options]

  options:  -a  |  --addprivs
            -u  |  --username       <admin_username>
            -p  |  --password       <admin_password>
            -h  |  --help

  Gives interactive session if no script specified.
\n";
    exit (1);
}
# --
