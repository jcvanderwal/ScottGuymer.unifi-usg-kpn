#!/bin/vbash

LOG_FILE=/var/log/igmpproxy-restart.log 

if [ ! -f $LOG_FILE ];
then
    touch $LOG_FILE
fi

echo $(date) "Running config-igmpproxy.pl" >> $LOG_FILE
/opt/vyatta/sbin/config-igmpproxy.pl --action=restart >> $LOG_FILE

# wait for proxy to come up
sleep 20

# check to see if it has actually started
pidof igmpproxy >/dev/null
if [[ $? -ne 0 ]] ; then
    echo $(date) "igmp-proxy not started" >> $LOG_FILE
else
    echo $(date) "igmp-proxy is started" >> $LOG_FILE
fi

# Saving it in "/config/scripts/post-config.d/loadIGMPProxy.sh" 
# chmod +x /config/scripts/post-config.d/loadIGMPProxy.sh