#!/bin/bash
#
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
## This installer forked and based on openstack-ocata-installer-centos7 v1.2.0.el7 "Siberian Lynx" released by:
## Reynaldo R. Martínez P. E-Mail: TigerLinux at Gmail dot com.
#
# Variable 1: Disk usage (bytes) - Nova Instances
# Variable 2: Disk usage (bytes) - Glance Images
#


PATH=$PATH:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin

du -c --block-size=1 /var/lib/nova/instances/|tail -n 1|awk '{print $1}'
du -c --block-size=1 /var/lib/glance/images/|tail -n 1|awk '{print $1}'
