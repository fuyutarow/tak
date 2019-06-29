#!/bin/bash
TAK_DIR=$HOME/.tak
pushd $TAK_DIR
go run go/makemigrations.go > schedule.csv
more schedule.csv
read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    go run go/push.go
    cat record.log >> record.archived.log
else
    :
fi
popd
