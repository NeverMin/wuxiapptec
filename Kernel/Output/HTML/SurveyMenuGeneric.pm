# --
# Kernel/Output/HTML/SurveyMenuGeneric.pm
# Copyright (C) 2001-2013 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::SurveyMenuGeneric;

use strict;
use warnings;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # check needed objects
    for my $Object (
        qw(ConfigObject EncodeObject LogObject DBObject LayoutObject UserID)
        )
    {
        $Self->{$Object} = $Param{$Object} || die "Got no $Object!";
    }

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Survey} ) {
        $Self->{LogObject}->Log(
            Priority => 'error',
            Message  => 'Need Survey!',
        );
        return;
    }

    # grant access by default
    my $Access = 1;

    # get groups
    my $Action   = $Param{Config}->{Action};
    my $GroupsRo = $Self->{ConfigObject}->Get('Frontend::Module')->{$Action}->{GroupRo} || [];
    my $GroupsRw = $Self->{ConfigObject}->Get('Frontend::Module')->{$Action}->{Group} || [];

    # check permission
    if ( $Action && ( @{$GroupsRo} || @{$GroupsRw} ) ) {

        # deny access by default, when there are groups to check
        $Access = 0;

        # check read only groups
        ROGROUP:
        for my $RoGroup ( @{$GroupsRo} ) {

            next ROGROUP if !$Self->{LayoutObject}->{"UserIsGroupRo[$RoGroup]"};
            next ROGROUP if $Self->{LayoutObject}->{"UserIsGroupRo[$RoGroup]"} ne 'Yes';

            # set access
            $Access = 1;
            last ROGROUP;
        }

        # check read write groups
        RWGROUP:
        for my $RwGroup ( @{$GroupsRw} ) {

            next RWGROUP if !$Self->{LayoutObject}->{"UserIsGroup[$RwGroup]"};
            next RWGROUP if $Self->{LayoutObject}->{"UserIsGroup[$RwGroup]"} ne 'Yes';

            # set access
            $Access = 1;
            last RWGROUP;
        }
    }

    return $Param{Counter} if !$Access;

    # output menu item
    $Self->{LayoutObject}->Block(
        Name => 'MenuItem',
        Data => {
            %Param,
            %{ $Param{Survey} },
            %{ $Param{Config} },
        },
    );

    $Param{Counter}++;

    return $Param{Counter};
}

1;
