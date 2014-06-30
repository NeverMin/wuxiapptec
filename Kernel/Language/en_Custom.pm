# --
# Kernel/Language/xx_Custom.pm - provides xx custom language translation
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::en_Custom;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # $$START$$

      $Self->{Translation} = {
            %{$Self->{Translation}},
            #'Zip' => 'EMPNO',
            'CustomerID' => 'EMPNO',
            'Tip: Your User Name' => 'User name is the one used to login windows, and the password as well. e.g. : abc_de',
            'Powered by' => ' ',
            'Tip: Type' => 'Location',
            'Tip: Subject' => 'Title',
            'Tip: Text' => 'Description',
            'Tip: Help' => 'Need help',
        };

    # $$STOP$$
}

1;
