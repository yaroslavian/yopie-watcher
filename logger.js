const CRITICAL_EVENTS_LIST = [
    'CREATE',
    'MODIFY',
    'DELETE',
    'MOVE'
];

var fs = require('fs'),
    checkUser = require('./usercheck.js').checkUser,
    checkDate = require('./datechecker.js').checkDate,
    checkFileType = (types, filename) => {
        var arr = filename.split('.'),
            ext = arr[arr.length - 1];  
        
        return types.indexOf(ext) !== -1 ? true : false;
    },
    isCritical = (data, critFTypes) => {
        var event = data.event,
            filename = data.filename;

        if(CRITICAL_EVENTS_LIST.indexOf(event) !== -1) {
            return checkFileType(critFTypes, filename);
        }

        return false;
    },
    writeLog = (rawData, logPath, critFTypes) => {
        var data = JSON.parse(rawData),
            result = `${data.directory}\t${data.filename}\t${data.event}\t${data.date}`,
            logFile = `${logPath}/watcher.log`,
            criticalLogFile = `${logPath}/critical.log`;

        if (isCritical(data, critFTypes)) {
            let date = checkDate(),
                userName = checkUser(`${data.directory}/${data.filename})`);

            if (date !== null) {
                result = `\n---------${date}----------\n${result}`;
            }
        
            if (userName) {
                result += ` ${userName}`;
            }

            result += '\n';

            fs.appendFile(criticalLogFile, result, (err) => {
                if (err) {
                    throw err;
                }
            });
        }

    fs.appendFile(logFile, result, (err) => {
      if (err) {
        throw err;
      }
    });
    return void 0;
};

exports.writeLog = writeLog;