#!/bin/bash
TAK_DIR=$HOME/.tak

function getEndtime() {
  start_time=`cat ${TAK_DIR%/}/timer.txt`
  now_time=`date +%s`

  SS=$((${now_time} - ${start_time}))
  HH=$((${SS} / 3600))
  SS=$((${SS} % 3600))
  MM=$((${SS} / 60))
  SS=$((${SS} % 60))

  echo "elapsed time: ${HH}:${MM}:${SS}"
}

getEndtime
