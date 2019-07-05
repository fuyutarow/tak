#!/bin/bash
TAK_DIR=$HOME/.tak

status_toml=${TAK_DIR%/}/status.toml
config_toml=${TAK_DIR%/}/config.tml


GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

function echoElapsedTime() {

  start_time=$(cat $status_toml | grep checkpoint | awk -F' = ' '{print $NF}')
  now_time=`date +%s`

  SS=$((${now_time} - ${start_time}))
  HH=$((${SS} / 3600))
  SS=$((${SS} % 3600))
  MM=$((${SS} / 60))
  SS=$((${SS} % 60))

  echo " (elapsed time: ${HH}:${MM}:${SS})"
}

function echoStatus() {
  tak_status=$(cat $status_toml | grep status | awk -F\" '{print $2}')
  if [ $tak_status = "active" ]; then
    echo -en "status: ${GREEN}${tak_status}${NC}"
  else
    echo -en "status: ${YELLOW}${tak_status}${NC}"
  fi
  echoElapsedTime
}

function echoBranch() {
  branch_name=$(cat $config_toml | grep name | awk -F\" '{print $2}')
  echo -e "On branch: ${GREEN}${branch_name}${NC}"
}
 

echoBranch
echoStatus
echo now: `date -R`
