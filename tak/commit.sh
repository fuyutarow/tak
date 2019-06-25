#!/bin/bash

read -p "What: " WHAT
read -p "Where: " WHERE

echo -e "commit\t$WHAT\t$WHERE" >> record.log
echo commit \"$WHAT\" in $WHERE
