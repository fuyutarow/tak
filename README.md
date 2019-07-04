# Tak

## Requirements
- Go
- [konojunya/generate-schedule-calendar](https://github.com/konojunya/generate-schedule-calendar)
- [shc](https://github.com/neurobin/shc) `brew install shc` or `apt install shc`


## Setup
You need creae 2 files.
- `config.tml`
  Declare Google calendarId. e.g. [config.tml](config.tml)
- `client_secrete.json`
  Use one generated [Google Cloud Console](https://console.cloud.google.com)


## Install
```sh
git clone https://github.com/fuyutarow/tak
shc -f tak/command/main.sh -o /usr/local/bin/tak
```


## Usages

```sh
Usage: tak <command> [<args>]

  begin       Log record When you start
  start       Alias to start
  end         Log recored what and when you end task
  push        Push to your Google Calendar
  open        Open your Google Calendar with web browser
  branch      Show list of branches
  checkout    Switch branch
  edit        Edit record
  makebranch  Make a new branch
  issue       Open GitHub issue with web browser
  status      Display tak status
  update      Update tak version
```
