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

      $Self->{Translation} = {
            %{$Self->{Translation}},
            'Dashboard' => '信息中心',
            #'Zip' => '工号',
            'CustomerID' => '工号',
            'Tip: Your User Name' => '用户名为邮箱登录名，如邮箱为 abc@wuxiapptec.com，那么用户名为 abc',
            'Powered by' => ' ',
        };

    # $$STOP$$
}

1;
