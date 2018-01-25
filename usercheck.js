var fs = require('fs'),
    childProcess = require('child_process'),
    checkUser = (filename) => {
        var result = '',
            spawn = childProcess.spawnSync,
            options = [filename, '--format="%u / %U"'],
            userCheck = spawn('stat', options);
            
        result = userCheck.stdout.toString().replace("\n", "");
        return result;
    };

exports.checkUser = checkUser;