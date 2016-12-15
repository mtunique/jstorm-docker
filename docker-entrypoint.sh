#!/bin/bash

CONFIG="$JSTORM_HOME/conf/storm.yaml"

if [ ! -f "$CONFIG" ]; then
    cat << EOF > "$CONFIG"
storm.zookeeper.servers: [zookeeper]
nimbus.seeds: [nimbus]
EOF
fi


exec "$@"
