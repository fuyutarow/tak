#!/bin/bash
TAK_DIR=$HOME/.tak

read -p "What: " WHAT
read -p "Where: " WHERE

echo -e 'start\t'$(date "+%Y\t%m\t%d\t%R") >> ${TAK_DIR%/}/record.log
echo start at $(date "+%Y-%m-%dT%T")

echo -e "commit\t$WHAT\t$WHERE" >> ${TAK_DIR%/}/record.log
echo commit \"$WHAT\" in $WHERE
