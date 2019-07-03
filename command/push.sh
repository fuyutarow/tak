#!/bin/bash
TAK_DIR=$HOME/.tak
pushd $TAK_DIR
go run go/makemigrations.go > schedule.csv
more schedule.csv
read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    go run go/push.go
    cat record.toml >> record.archived.toml
    cat record.log >> record.archived.log
    cat '' > record.log
else
    :
fi
popd
