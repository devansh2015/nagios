#!/bin/bash

now=`date +%s`
host=$1;
commandfile='/usr/local/nagios/var/rw/nagios.cmd'

/usr/bin/printf "[%lu] ENABLE_HOST_AND_CHILD_NOTIFICATIONS;$host\n" $now > $commandfile
