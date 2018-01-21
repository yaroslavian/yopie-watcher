var throwErr = (str) => {
    throw str;
}

var fs = require('fs'), // File system module
    watch = require('./watch.js').watch,
    critFTypes = critFTypes || ["php", "js"],
    args = process.argv, // Command arguments
    conf = {};

if (args[2]) {
    if (args[2].indexOf('--config') === 0) {
        let configPath = args[2].slice(10,-1);

        if (configPath) {
            try {
                let config = require(configPath);

                if(config) {
                    conf.watchPath = config.watchPath || throwErr('undefined watch directory in config file'),
                    conf.logPath = config.logPath || throwErr('undefined log directory in config file'),
                    conf.critFTypes = config.criticalFileTypes || undefined;
                }    
            } catch (e) {
                throw "Invalid config file --> " + e;
            }
        } else {
            throw "CONFIG FILE IS MISSING";
        }
    } else {
        conf.watchPath = args[2] || throwErr('WATCH FOLDER IS NOT DEFINED'),
        conf.logPath = args[3] || throwErr('LOG FOLDER IS NOT DEFINED');
    }
} else {
    throw "NO PARAMETRS SET";
}

var setLogFolder = (logPath, watchPath, cb) => {
    return fs.stat(conf.logPath, (err, stats) => {
        if (err) {
            throw "ERROR: Log directory does not exist --> " + err;
        } else if (!stats.isDirectory()) {
            throw "ERROR: " + logPath + " is not a directory";
        } else {
            return cb(watchPath, logPath, critFTypes);
        }
    });
};

setLogFolder(conf.logPath, conf.watchPath, watch);