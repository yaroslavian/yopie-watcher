fs = require 'fs'

isCritical = (data) ->
  event = data.event
  filename = data.filename

  if (event == "CREATE" || event == "MODIFY" || event == "DELETE" || (event.search(/MOVE/)>=0) )
    if (filename.search(/\.php$/)>=0 || filename.search(/\.html$/)>=0 || filename.search(/\.js$/)>=0)
      return true
      
  else return false

writeLog = (data, logPath) ->

  data = JSON.parse(data)

  result = "#{data.directory}\t#{data.filename}\t#{data.event}\t#{data.date}\n"

  logFile = "#{logPath}/watcher.log"
  criticalLogFile = "#{logPath}/critical.log"

  if isCritical(data)
    fs.appendFile criticalLogFile, result, (err) ->
      if err then throw err

  fs.appendFile logFile, result, (err) ->
    if err then throw err

exports.writeLog = writeLog
