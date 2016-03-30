# fs=require
watch = (require './watch.js').watch

# path = require 'path'

# watchPath = process.argv[2] || "/home/sunset/coding/nodejs/filewatcher/ver2/testdir"
# if not process.argv[2] then throw "ERRRRRRRRRRROR!!!"

watchPath = process.argv[2] || throw "НЕ УКАЗАНА ДИРРЕКТОРИЯ ДЛЯ СЛЕЖЕНИЯ"


watch(watchPath)
