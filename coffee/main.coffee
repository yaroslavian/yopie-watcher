fs = require 'fs'
watch = (require './watch.js').watch

watchPath = process.argv[2] || throw "WATCH FOLDER IS NOT DEFINED"
logPath = process.argv[3] || throw "LOG FOLDER IS NOT DEFINED"

setLogFolder = (logPath, cb) ->
  fs.stat logPath, (err, stats) ->
    if err
      throw "ERROR: Log directory does not exist --> #{err}"
    else if not stats.isDirectory()
      throw "ERROR: #{logPath} is not a directory"
    else
      cb(watchPath, logPath)

setLogFolder logPath, watch

# watch watchPath, logPath
