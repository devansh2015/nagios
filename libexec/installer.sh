#!/bin/bash

`sudo yum install -y xinetd openssl`;
NRPE_ENTRY=`cat /etc/services | grep "nrpe" | grep "5666" | grep "tcp" | wc -l`;

if [ $NRPE_ENTRY -eq 0 ];then
echo "Nrpe service updated ########";
`echo "nrpe            5666/tcp" >> /etc/services`;
fi

NAGIOS_USER=`cat /etc/passwd | grep nagios | wc -l`;
NAGIOS_GROUP=`cat /etc/group | grep nagios | wc -l`;

if [ $NAGIOS_GROUP -eq 0 ];then
echo "Nagios Group Added  ##########";
`groupadd nagios --gid 1200`;
fi

if [ $NAGIOS_USER -eq 0 ];then
echo "Nagios User Added ##########";
`useradd nagios --uid 1200 -g nagios -c "Nagios Applications ID" -d /usr/local/nagios -s /sbin/nologin`;
fi
