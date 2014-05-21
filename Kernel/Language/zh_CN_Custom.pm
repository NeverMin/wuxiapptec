# --
# Kernel/Language/xx_Custom.pm - provides xx custom language translation
# Copyright (C) 2001-2014 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::zh_CN_Custom;

use strict;
use warnings;

sub Data {
    my $Self = shift;

    # $$START$$

    # own translations
    $Self->{Translation}->{'CustomerID'} = '工号';

    # or a other syntax would be
    #    $Self->{Translation} = {
    #        %{$Self->{Translation}},
    #        # own translations
    #        Lock => 'Lala',
    #        UnLock => 'Lulu',
    #    };

    # $$STOP$$
}

1;
