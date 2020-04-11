#!/bin/vbash

LOG_FILE=/var/log/dhcp-renew.log

if [ ! -f $LOG_FILE ];
then
    touch $LOG_FILE
fi

echo $(date) "Show DHCP lease before renew" >> $LOG_FILE
/bin/vbash -ic 'show dhcp client leases' &>> $LOG_FILE
echo $(date) "Release DHCP lease" >> $LOG_FILE
/bin/vbash -ic 'release dhcp interface eth0.4' &>> $LOG_FILE
echo $(date) "Renew DHCP lease" >> $LOG_FILE
/bin/vbash -ic 'renew dhcp interface eth0.4' &>> $LOG_FILE
echo $(date) "Show DHCP lease after renew" >> $LOG_FILE
/bin/vbash -ic 'show dhcp client leases' &>> $LOG_FILE
echo $(date) "END DHCP Renew Script" >> $LOG_FILE
