fs = require 'fs'
checkUser = (require './usercheck.js').checkUser
checkDate = (require "./datechecker.js").checkDate

checkFileType = (types, filename) ->
  # console.log types
  res = no
  for type in types
    if !res
      # console.log type
      reg = "\\.#{type}$"
      flags = 'gi'
      # console.log "reg = /#{reg}/#{flags}"
      reg = new RegExp(reg, flags)
      # console.log "!!! --> #{filename}" if filename.search(reg)>=0
      if i=filename.search(reg)>=0
        res = yes
      else res = no

  return res

isCritical = (data, critFTypes) ->
  event = data.event
  filename = data.filename

  if (event == "CREATE" || event == "MODIFY" || event == "DELETE" || (event.search(/MOVE/)>=0) )
    return checkFileType(critFTypes, filename)


  else return false

writeLog = (data, logPath, critFTypes) ->

  data = JSON.parse(data)

  result = "#{data.directory}\t#{data.filename}\t#{data.event}\t#{data.date}"

  logFile = "#{logPath}/watcher.log"
  criticalLogFile = "#{logPath}/critical.log"

  if isCritical(data, critFTypes)
    date = do checkDate
    if date!=null
      result = "\n---------#{date}----------\n#{result}"
    userName = checkUser("#{data.directory}/#{data.filename}")
    if userName then result += " #{userName}\n"
    else result+="\n"

    fs.appendFile criticalLogFile, result, (err) ->
      if err then throw err

  fs.appendFile logFile, result, (err) ->
    if err then throw err

exports.writeLog = writeLog
