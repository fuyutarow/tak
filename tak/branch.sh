#!/bin/bash

TAK_DIR=$HOME/.tak
COMMAND_DIR=$(cd $(dirname ${0}); pwd)

CurrentBranch=$(cat $TAK_DIR/config.tml | grep name | cut -f3 -d' ' | cut -f2 -d'"')

for f in ${TAK_DIR%/}/branches/*; do
  filename=$(echo "$f" | awk -F'/' '{print $NF}')
  BranchName=${filename%.*}
  if [ $BranchName = $CurrentBranch ]; then
    echo "* $BranchName"
  else
    echo "  $BranchName"
  fi
done
