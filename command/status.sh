#!/bin/bash
TAK_DIR=$HOME/.tak

status_toml=${TAK_DIR%/}/status.toml
config_toml=${TAK_DIR%/}/config.tml


GREEN='\033[0;32m'
NC='\033[0m' # No Color]]

function getEndtime() {

  start_time=$(cat $status_toml | grep checkpoint | awk -F' = ' '{print $NF}')
  now_time=`date +%s`

  SS=$((${now_time} - ${start_time}))
  HH=$((${SS} / 3600))
  SS=$((${SS} % 3600))
  MM=$((${SS} / 60))
  SS=$((${SS} % 60))

  echo "elapsed time: ${HH}:${MM}:${SS}"
}

branch_name=$(cat $config_toml | grep name | awk -F' = ' '{print $NF}')
 
echo -e "On branch: ${GREEN}${branch_name}${NC}"

echo now: `date -R`
getEndtime
