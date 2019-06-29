#!/bin/bash

TAK_DIR=$HOME/.tak

read -p "What: " WHAT
read -p "Where: " WHERE

echo -e "commit\t$WHAT\t$WHERE" >> ${TAK_DIR%/}/record.log
echo commit \"$WHAT\" in $WHERE
