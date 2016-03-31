logger = require './logger.js'

watch = (watchPath, logPath) ->

  spawn = (require('child_process')).spawn
  options = ['-mr', '--timefmt', '%d-%b-%Y %H:%M:%S', '--format', '{"directory":"%w", "filename":"%f", "event":"%_e", "date":"%T"}' , watchPath]
  watcher = spawn 'inotifywait', options

  watcher.stdout.on 'data', (data) ->
    str = data.toString()
    str = str.split "\n"

    for element in str
      if element
        logger.writeLog element, logPath


  watcher.stderr.on 'data', (data) ->
    console.log "ERROR! --> #{data}"

  watcher.on "close", ->
    console.log "\n ---> EXIT --->\n"

exports.watch = watch
