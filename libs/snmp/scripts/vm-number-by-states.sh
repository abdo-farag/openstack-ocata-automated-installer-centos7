#!/bin/bash
#
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
## This installer forked and based on openstack-ocata-installer-centos7 v1.2.0.el7 "Siberian Lynx" released by:
## Reynaldo R. Martínez P. E-Mail: TigerLinux at Gmail dot com.
#
#
#
# Variable 1: VM's in running state
# Variable 2: VM's in shutoff state
# Variable 3: VM's in paused state
# Variable 4: VM's in other states
# Variable 5: Number of all VM's configured in the server
#


PATH=$PATH:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin

vmrun=`virsh list --all|grep -ci "running"`
vmoff=`virsh list --all|grep -ci "shut off"`
vmpsd=`virsh list --all|grep -ci "paused"`
vmoth=`virsh list --all|grep -ci "other"`
vmtot=$[vmrun+vmoff+vmpsd+vmoth]

echo $vmrun
echo $vmoff
echo $vmpsd
echo $vmoth
echo $vmtot
