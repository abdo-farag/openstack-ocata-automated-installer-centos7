#!/bin/bash
#
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
#
## This script configures Nova to perform live migration option.
#

source $keystone_fulladmin_rc_file

usermod -s /bin/bash nova  > /dev/null 2>&1
echo "$novapass" | passwd nova --stdin > /dev/null 2>&1
rm -rf /var/lib/nova/.ssh/id_rsa*
sudo -u nova ssh-keygen -q -N "" -f /var/lib/nova/.ssh/id_rsa  > /dev/null 2>&1
host=`hostname`
novahost=`nova service-list | awk -F " " '{print $6}' |grep -v "Host" | grep -Ev "^$" | awk '!seen[$0]++'| grep -v "$host"`
for i in `echo -e "$novahost"`
do
sshpass -p $novapass ssh-copy-id -o StrictHostKeyChecking=no -i /var/lib/nova/.ssh/id_rsa.pub nova@$i  > /dev/null 2>&1
done

echo "Host *" > /var/lib/nova/.ssh/config
echo "StrictHostKeyChecking no" >> /var/lib/nova/.ssh/config
echo "UserKnownHostsFile=/dev/null" >> /var/lib/nova/.ssh/config

