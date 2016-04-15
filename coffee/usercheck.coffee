fs = require 'fs'

checkUser = (filename) ->
  result = ""
  spawn = (require('child_process')).spawnSync
  options = [filename, "--format=uid %u - %U"]
  userCheck = spawn 'stat', options

  result = userCheck.stdout.toString()
  result = result.replace("\n","")
  if result then return result
  else undefined

exports.checkUser = checkUser
