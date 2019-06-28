#!/bin/bash

COMMAND_DIR=$(cd $(dirname ${0}); pwd)
REPO_DIR=$COMMAND_DIR/../
TAK_DIR=$REPO_DIR/.tak


CurrentBranch=$(cat $REPO_DIR/config.tml | grep name | cut -f3 -d' ' | cut -f2 -d'"')

for f in $TAK_DIR/*; do
  filename=$(echo "$f" | awk -F'/' '{print $NF}')
  BranchName=${filename%.*}
  if [ $BranchName = $CurrentBranch ]; then
    echo "* $BranchName"
  else
    echo "  $BranchName"
  fi
done
