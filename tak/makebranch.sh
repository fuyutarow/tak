#!/bin/bash
DIR_BASE=$(cd $(dirname ${0}); pwd)
TAK_DIR=$DIR_BASE/../.tak
echo $DIR_BASE
echo $TAK_DIR

# open "https://calendar.google.com/calendar/r/settings/createcalendar"

read -p "CalendarId: " CalendarId
read -p "New branch name: " BranchName

# trim white space
BranchName="$(echo -e "${BranchName}" | tr -d '[:space:]')"

Config=`cat <<EOM
[core]
name = "$BranchName"

[calendar]
id = "$CalendarId"
EOM
`

echo "$Config"

read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "$Config" > $TAK_DIR/$BranchName.toml
    echo $BranchName >> $TAK_DIR/branch_list.csv
else
    :
fi
