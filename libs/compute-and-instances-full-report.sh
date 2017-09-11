#!/bin/bash
#
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
## This installer forked and based on openstack-ocata-installer-centos7 v1.2.0.el7 "Siberian Lynx" released by:
## Reynaldo R. Martínez P. E-Mail: TigerLinux at Gmail dot com.
#
# This script list's to console all compute nodes and it's associated
# instances
#

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

mykeystonefile="/root/keystonerc_admin"

#
# First we source our keystone admin file so we can connect to nova
#

source $mykeystonefile

#
# Next, we fill the "hypervisorlist" variable with all compute nodes in the cloud
#

# hypervisorlist=`nova hypervisor-list|grep \||grep -v ID|awk '{print $4}'|cut -d. -f1`
# hypervisorlist=`nova hypervisor-list|grep \||grep -v ID|awk '{print $4}'`
hypervisorlist=`openstack hypervisor list|grep \||grep -v ID|awk '{print $4}'`

#
# Then, we "loop" all the compute nodes and list it's configured instances
#

for compute in $hypervisorlist
do
	echo ""
	echo ""
	echo "INSTANCES CONFIGURED AT COMPUTE NODE: $compute"
	echo ""
	# nova list --all-tenants --host $compute
	openstack server list --all-projects --host $compute
	echo ""
done
