#!/bin/bash

# TODO: interactive arguments
if [ $# -ne 2 ]; then
  echo "$# arguments are required" 1>&2
  exit 1
fi

cat <<__EOT__
(what)  $1
(where) $2
__EOT__

echo -e "commit\t$1\t$2" >> record.log
echo commit \"$1\" in $2
