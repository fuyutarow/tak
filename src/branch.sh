#!/bin/bash

TAK_DIR=$HOME/.tak
COMMAND_DIR=$(cd $(dirname ${0}); pwd)

CurrentBranch=$(cat $TAK_DIR/config.tml | grep name | cut -f3 -d' ' | cut -f2 -d'"')

for f in ${TAK_DIR%/}/branches/*; do
  filename=$(echo "$f" | awk -F'/' '{print $NF}')
  BranchName=${filename%.*}
  if [ "$BranchName" = "$CurrentBranch" ]; then
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color]]
    echo -e "${GREEN}* ${BranchName}${NC}"
  else
    echo "  $BranchName"
  fi
done
