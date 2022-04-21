#!/bin/bash

mkdir -p /home/opuser/.op/data
chown -R 999 /home/opuser
chmod -R 700 /home/opuser
chmod -f -R 600 /home/opuser/.op/config || :
OP_HTTP_PORT=8080 /bin/connect-api &
OP_HTTP_PORT=9090 /bin/connect-sync &
wait -n
  
# Exit with status of process that exited first
exit $?
