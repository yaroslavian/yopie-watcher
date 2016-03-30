# yopie-watcher
Simple parser inotifywait watcher written by nodejs

This tool is just spawning "inotifywait" process for specified directory and then parsing all received data. It was made for self-usage on web server, but if it could be useful, you're always welcome.

REQUIREMENTS

"inotiytools" and "inotifywait" are required

USAGE

  nodejs main.js path_to_watched_directory path_to_logs_directory

  OR

  nodejs main.js --config path_to_configuration_file.json

