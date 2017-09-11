#!/bin/bash
#
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
## This installer forked and based on openstack-ocata-installer-centos7 v1.2.0.el7 "Siberian Lynx" released by:
## Reynaldo R. Martínez P. E-Mail: TigerLinux at Gmail dot com.
#
# NOVA VM's controlled startup script
#
#

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

myvmlist='/etc/openstack-control-script-config/nova-start-vms.conf'
mydelay="10"
keystonefile="/root/keystonerc_admin"

if [ ! -f $myvmlist ]
then
	echo ""
	echo "VM List Missing - Aborting !"
	echo ""
	exit 0
fi

if [ ! -f $keystonefile ]
then
	echo ""
	echo "Keystone File Missing - Aborting !"
	echo ""
	exit 0
fi

source $keystonefile

cat $myvmlist|grep -v ^#|while read LINE
do
	echo ""
	echo "Starting VM $LINE"
	nova start "$LINE"
	echo "Sleeping $mydelay seconds"
	echo ""
	sleep $mydelay
done
