fs = require 'fs'

formate = (data) ->

  # class Watcher
  # data = data.split " "
  data = JSON.parse(data)

  result = "#{data.directory}\t#{data.filename}\t#{data.event}\t#{data.date}\n"

  fs.appendFile 'watcher-log.txt', result, (err) ->
    if err then throw err




  # result = "#{data.event}"




  # res = data || "hello"
  # console.log data
  # console.log result

exports.formate = formate
