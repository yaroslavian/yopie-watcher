var logger = require('./logger.js'),
    watch = (watchPath, logPath, critFTypes) => {
        var spawn = (require('child_process')).spawn,
            options = ['-mr', '--timefmt', '%d-%b-%Y %H:%M:%S', '--format', '{"directory":"%w", "filename":"%f", "event":"%_e", "date":"%T"}', watchPath];
            watcher = spawn('inotifywait', options);
            
        watcher.stdout.on('data', (data) => {
            var 
                str = data.toString().split("\n"),
                results = [];

            for (let i = 0, len = str.length; i < len; i++) {
                let element = str[i];
                
                if (element) {
                    logger.writeLog(element, logPath, critFTypes);
                }
            }
            return results;
        });

        watcher.stderr.on('data', (data) => {
            console.log("\n --> " + data + "\n");
        });
        watcher.on("close", () => {
            console.log("\n ---> EXIT --->\n");
        });
    };

  exports.watch = watch;