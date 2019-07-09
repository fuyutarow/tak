#!/bin/bash

VERSION="0.0.7"

TAK_DIR=$HOME/.tak
CommandDir=$TAK_DIR/command

usage() {
cat<<EOS
Usage: tak <command> [<args>]

  start       Log record When you start
  stop        Log record what and when you end task
  edit        Edit current task
  amend       Edit record
  status      Display tak status
  makebranch  Make a new branch
  checkout    Switch branch
  branch      Show list of branches
  push        Push to your Google Calendar
  open        Open your Google Calendar with web browser
  issue       Open GitHub issue with web browser
  update      Update tak version
EOS
}

Subcommand=$1
shift
case "$Subcommand" in
    'help'|'-h'|'--help'|'')
        usage
        exit 1
        ;;
    'version'|'-v'|'--version')
        echo $VERSION
        exit 1
        ;;
    'start') bash $CommandDir/start.sh ;exit 1;;
    'stop') bash $CommandDir/stop.sh ;exit 1;;
    'edit') bash $CommandDir/edit.sh ;exit 1;;
    'amend') bash $CommandDir/amend.sh ;exit 1;;
    'status') bash $CommandDir/status.sh ;exit 1;;
    'makebranch') bash $CommandDir/makebranch.sh ;exit 1;;
    'checkout') bash $CommandDir/checkout.sh $@ ;exit 1;;
    'branch') bash $CommandDir/branch.sh ;exit 1;;
    'push') bash $CommandDir/push.sh ;exit 1;;
    'open') bash $CommandDir/open.sh ;exit 1;;
    'issue') bash $CommandDir/issue.sh ;exit 1;;
    'install') bash $TAK_DIR/scripts/install.sh ;exit 1;;
    'update') bash $TAK_DIR/scripts/update.sh ;exit 1;;
    *)
        ;;
esac


while read line; do
  if [ "$(echo $line | grep = )" ]; then 
    k=$(echo $line | cut -d'=' -f1 |xargs)
    v=$(echo $line | cut -d'=' -f2 |xargs)
    if [ $Subcommand = $k ]; then 
      if [[ $v =~ ^\s?! ]]; then
        shcmd=$(echo $v | cut -d'!' -f2 |xargs)
      else
        shcmd="tak $v $@"
      fi
      eval $shcmd
      exit 1
    fi
  fi
done < $HOME/.takconfig

echo -e "tak: '$Subcommand' is not a tak command. See 'tak help'."
