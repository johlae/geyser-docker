#! /bin/bash

CONFIG_FILE=/data/config.yml

cd /data

if [ ! -f $CONFIG_FILE ] || [ OVERWRITE_CONFIG -eq "yes" ]
then
    envsubst < /opt/config.yml.template > /data/config.yml
fi

java -Xms$INIT_MEMORY -Xmx$MAX_MEMORY -jar /opt/$JAR_FILE