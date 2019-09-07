# Tak :hourglass:

> Tool for keeping track of today's activity.


## Install
```sh
git clone https://github.com/fuyutarow/tak ~/.tak
(
    cd ~/.tak
    make install
)
```


## Usages
```sh
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
```

-----

# Push Google Calendar
## Requirements
- Go
- [konojunya/generate-schedule-calendar](https://github.com/konojunya/generate-schedule-calendar)


## Setup
You need create 2 files.
- `config.tml`
  Declare Google calendarId. e.g. [config.tml](config.tml)
- `client_secrete.json`
  Use one generated [Google Cloud Console](https://console.cloud.google.com)


## Usages
```sh
tak push
```
