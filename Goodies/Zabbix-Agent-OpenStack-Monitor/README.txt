OPENSTACK VARIABLES FOR ZABBIX
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
## This installer forked and based on openstack-ocata-installer-centos7 v1.2.0.el7 "Siberian Lynx" released by:
## Reynaldo R. Martínez P. E-Mail: TigerLinux at Gmail dot com.

In adition to SNMP, you can include the same variables in zabbix. For this purpose,
we have included an agent definition file that can be used with zabbix.

First, ensure you have installed the SNMP support. Then, copy the file included here
(zabbix_agentd_osvars.conf) en your /etc/zabbix_agentd.conf file or in the directories
parsed by zabbix agent.

The zabbix items defined here are listed bellow:

vm.number.running: VM's in "running" state in the node.
vm.number.configured: VM's configured in the node.
vm.instance.bytes.usage: VM's disk usage space inside the node.
vm.images.bytes.usage: Glance Images usage space.

NOTA: VM's = Virtual Machines. :-)

END.-
