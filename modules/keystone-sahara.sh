#!/bin/bash
#
## Unattended Installer (Semi Automated) for OpenStack (OCATA)
## Abdo Farag
## E-Mail: abdofarag85@gmail.com
## This installer forked and based on openstack-ocata-installer-centos7 v1.2.0.el7 "Siberian Lynx" released by:
## Reynaldo R. Martínez P. E-Mail: TigerLinux at Gmail dot com.
#
#

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

if [ -f ./configs/main-config.rc ]
then
	source ./configs/main-config.rc
	mkdir -p /etc/openstack-control-script-config
else
	echo "Can't access my config file. Aborting !"
	echo ""
	exit 0
fi

if [ -f /etc/openstack-control-script-config/db-installed ]
then
	echo ""
	echo "DB Proccess OK. Let's continue"
	echo ""
else
	echo ""
	echo "DB Proccess not completed. Aborting !"
	echo ""
	exit 0
fi


if [ -f /etc/openstack-control-script-config/keystone-installed ]
then
	echo ""
	echo "Keystone Proccess OK. Let's Continue"
	echo ""
else
	echo ""
	echo "Keystone Proccess not complete. Aborting !"
	echo ""
	exit 0
fi

if [ -f /etc/openstack-control-script-config/keystone-extra-idents-sahara ]
then
	echo ""
	echo "This module was already completed. Exiting !"
	echo ""
	exit 0
fi

source $keystone_fulladmin_rc_file

echo ""
echo "Creating SAHARA Identities"
echo ""

echo "Sahara User:"
openstack user create --domain $keystonedomain --password $saharapass --email $saharaemail $saharauser

echo "Sahara Tenant:"
openstack project create --domain $keystonedomain $saharauser

echo "Sahara Tenants Role: $saharauser and $keystoneservicestenant"
openstack role add --project $keystoneservicestenant --user $saharauser $keystoneadminuser
openstack role add --project $saharauser --user $saharauser $keystoneadminuser

echo "Sahara Service:"
openstack service create \
        --name $saharasvce \
        --description "Data Processing Service" \
        data_processing

echo "Sahara Endpoints:"

openstack endpoint create --region $endpointsregion \
	data_processing public "http://$saharahost:8386/v1.1/\$(tenant_id)s"

openstack endpoint create --region $endpointsregion \
	data_processing internal "http://$saharahost:8386/v1.1/\$(tenant_id)s"

openstack endpoint create --region $endpointsregion \
	data_processing admin "http://$saharahost:8386/v1.1/\$(tenant_id)s"

date > /etc/openstack-control-script-config/keystone-extra-idents-sahara

echo "Ready"

echo ""
echo "SAHARA Identities Created"
echo ""

