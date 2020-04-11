#!/bin/vbash

LOG_FILE=/var/log/igmpproxy-restart.log

if [ ! -f $LOG_FILE ];
then
    touch $LOG_FILE
fi
      
pidof igmpproxy >/dev/null
if [[ $? -ne 0 ]] ; then
    echo $(date) "restarting igmp-proxy" >> $LOG_FILE
    /bin/vbash -ic 'restart igmp-proxy' >> $LOG_FILE
else
    echo $(date) "igmp-proxy is already started" >> $LOG_FILE
fi

# Saving it in "/config/scripts/post-config.d/loadIGMPProxy.sh" 
# chmod +x /config/scripts/post-config.d/loadIGMPProxy.sh