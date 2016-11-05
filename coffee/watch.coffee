logger = require './logger.js'

watch = (watchPath, logPath, critFTypes) ->

  spawn = (require('child_process')).spawn
  options = ['-mr', '--timefmt', '%d-%b-%Y %H:%M:%S', '--format', '{"directory":"%w", "filename":"%f", "event":"%_e", "date":"%T"}' , watchPath]
  watcher = spawn 'inotifywait', options

  watcher.stdout.on 'data', (data) ->
    str = data.toString().split "\n"

    for element in str
      if element then logger.writeLog element, logPath, critFTypes

  watcher.stderr.on 'data', (data) ->
    console.log "\n --> #{data}\n"

  watcher.on "close", ->
    console.log "\n ---> EXIT --->\n"

exports.watch = watch
