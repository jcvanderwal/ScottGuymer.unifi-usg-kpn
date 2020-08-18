#!/bin/vbash

LOG_FILE=/var/log/igmpproxy-check.log 

if [ ! -f $LOG_FILE ];
then
    touch $LOG_FILE
fi

# check to see if it has actually started
pidof igmpproxy >/dev/null
if [[ $? -ne 0 ]] ; then
    {
      echo" $(date)" "igmp-proxy not started" 
      echo "$(date)" "Running config-igmpproxy.pl" 
      /opt/vyatta/sbin/config-igmpproxy.pl --action=restart
    } >> $LOG_FILE

else
    echo "$(date)" "igmp-proxy is started" >> $LOG_FILE
fi

# Saving it in "/config/scripts/post-config.d/igmpcheck.sh" 
# chmod +x /config/scripts/post-config.d/igmpcheck.sh