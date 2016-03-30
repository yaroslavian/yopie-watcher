fs = require 'fs'

formate = (data, logPath) ->

  data = JSON.parse(data)

  result = "#{data.directory}\t#{data.filename}\t#{data.event}\t#{data.date}\n"

  logFile = "#{logPath}/watcher-log.txt"

  fs.appendFile logFile, result, (err) ->
    if err then throw err

exports.formate = formate
