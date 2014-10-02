#!/bin/bash

# trap handler: print location of last error and process it further
#
function the_trap_handler()
{
        MYSELF="$0"               # equals to my script name
        LASTLINE="$1"            # argument 1: last line of error occurence
        LASTERR="$2"             # argument 2: error code of last command
        echo "${MYSELF}: line ${LASTLINE}: exit status of last command: ${LASTERR}"
}

# trap commands with non-zero exit code
#
trap 'the_trap_handler ${LINENO} $?' ERR

SD=${BASH_SOURCE%/*}
uptime
uustat -a
uustat -m
df -h /
pppstats
docker ps
systemctl status serial-mgetty@ttyS1.service
systemctl status ltfhc-couch.service

# to prevent job congestion for sustained error (critical mode) delete job queue.
exit