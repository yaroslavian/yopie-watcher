fs = require 'fs'

writeLog = (data, logPath) ->

  data = JSON.parse(data)

  ###
  filename = data.filename


  if (filename.search(/\.php$/) || filename.search(/\.html$/) || filename.search(/\.js$/))
    console.log "!!!!"
  ###
  
  result = "#{data.directory}\t#{data.filename}\t#{data.event}\t#{data.date}\n"

  logFile = "#{logPath}/watcher-log.txt"

  fs.appendFile logFile, result, (err) ->
    if err then throw err

exports.writeLog = writeLog
