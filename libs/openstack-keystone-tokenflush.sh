#!/bin/bash
#
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
## This installer forked and based on openstack-ocata-installer-centos7 v1.2.0.el7 "Siberian Lynx" released by:
## Reynaldo R. Martínez P. E-Mail: TigerLinux at Gmail dot com.
#
# Keystone Tokens cleanup script
#

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

mysourcerc="/root/keystonerc_admin"
mykeystonecommand="keystone-manage"
mykeystoneoption="token_flush"

echo ""
echo -n "Starting Keystone Old Tokens FLush. Date/Time: "
date

echo ""

source $mysourcerc
$mykeystonecommand $mykeystoneoption

echo ""
echo -n "Keystone Old Tokens Flush Ended. Date/Time: "
date

echo ""
