lib = require './lib.js'

watch = (watchPath) ->

  spawn = (require('child_process')).spawn
  options = ['-mr', '--timefmt', '%d-%b-%Y %H:%M', '--format', '{"directory":"%w", "filename":"%f", "event":"%_e", "date":"%T"}' , watchPath]
  watcher = spawn 'inotifywait', options

  watcher.stdout.on 'data', (data) ->
    str = data.toString()
    str = str.split "\n"

    for element in str
      if element
        lib.formate element


  watcher.stderr.on 'data', (data) ->
    console.log "ERROR! --> #{data}"

  watcher.on "close", ->
    console.log "\n ---> EXIT --->\n"

exports.watch = watch
