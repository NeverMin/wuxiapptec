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
            'Tip: Your User Name' => 'User Name is your E-mail login name, e.g.: your email address is ABC@wuxiapptec.com, ABC is your User Name',
            'Powered by' => ' ',
            'Tip: Type' => 'Location',
            'Tip: Subject' => 'Title',
            'Tip: Text' => 'Description',
        };

    # $$STOP$$
}

1;
