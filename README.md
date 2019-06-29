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

- `./tak/start`
  Log record when you start task.
- `./tak/commit`
  Log record what and where you do.
- `./tak/end`
  Log record when you end task.
- `./tak/edit`
  Edit record.
- `./tak/push`
  Push to your Google Calendar.
- `./tak/open`
  Open your Google Calendar.
- `./tak/makebranch`
  Make a new branch
- `./tak/branch`
  Show list of branche
- `./tak/checkout`
  Switch branch
