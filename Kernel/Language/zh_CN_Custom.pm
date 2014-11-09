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
            'CustomerID' => '工号',
            'Tip: Your User Name' => '用户名是您开机登陆 windows 系统的用户名, 密码是您开机登陆 windows 系统的密码!',
            'Powered by' => ' ',
            'Tip: Type' => '地点',
            'Tip: Subject' => '标题',
            'Tip: Text' => '描述',
            'Tip: Help' => '需要帮助',
            'WGQ' => '外高桥',
            'TianJin' => '天津',
            'WuXi' => '无锡',
            'SuZhou' => '苏州',
            'BeiJing' => '北京',
            'JinShan' => '金山',
            'ChangZhou' => '常州',
            'WuHan' => '武汉',
            'HongKong' => '香港',
            'GuangZhou' => '广州',
            'ShangHai' => '上海',
            'Street' => '地址',
            'Address' => '办公室',
            'Comment' => '部门',
        };

    # $$STOP$$
}

1;
