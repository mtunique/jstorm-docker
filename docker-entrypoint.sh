#!/bin/bash

# Generate the config only if it doesn't exist
CONFIG="$JSTORM_HOME/conf/storm.yaml"
# if [ ! -f "$CONFIG" ]; then
cat << EOF > "$CONFIG"
storm.zookeeper.servers: [zookeeper]
nimbus.host: [nimbus]
EOF
#fi

exec "$@"
