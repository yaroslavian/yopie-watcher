# yopie-watcher
Simple parser **[inotifywait](https://linux.die.net/man/1/inotifywait)** watcher written using **Node.JS**.

This tool is just spawning **[inotifywait](https://linux.die.net/man/1/inotifywait)** process for specified directory and then parsing all received data. It was made for self-usage on web server, but if it could be useful, you're always welcome.

### REQUIREMENTS

**[inotify-tools](https://github.com/rvoicilas/inotify-tools/wiki)** and **[inotifywait](https://linux.die.net/man/1/inotifywait)** packages required.

### USAGE
```shell
  nodejs main.js path_to_watched_directory path_to_logs_directory
```
  OR
```shell
  nodejs main.js --config path_to_configuration_file.json
```
___
Tested in combination with **[pm2](https://github.com/Unitech/pm2)** as a process manager.
