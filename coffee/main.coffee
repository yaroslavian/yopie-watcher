fs = require 'fs'
watch = (require './watch.js').watch

#checking arguments
if process.argv[2]
  if process.argv[2] == "--config"
    if process.argv[3]
      try
        if config = require "./#{process.argv[3]}"
          watchPath = config.watchPath || throw "undefined watch directory in config file"
          logPath = config.logPath || throw "undefined log directory in config file"
          critFTypes = config.criticalFileTypes || undefined
      catch e
        throw "Invalid config file --> " + e
    else throw "CONFIG FILE IS MISSING"
  else
    watchPath = process.argv[2] || throw "WATCH FOLDER IS NOT DEFINED"
    logPath = process.argv[3] || throw "LOG FOLDER IS NOT DEFINED"
else throw "NO PARAMETRS SET"

critFTypes = critFTypes || ["php", "js"]

setLogFolder = (logPath, cb) ->
  fs.stat logPath, (err, stats) ->
    if err
      throw "ERROR: Log directory does not exist --> #{err}"
    else if not stats.isDirectory()
      throw "ERROR: #{logPath} is not a directory"
    else
      cb(watchPath, logPath, critFTypes)

setLogFolder logPath, watch

# watch watchPath, logPath
