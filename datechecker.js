var getDateInt = (date) => {
        var day = date.getDate(),
            month = date.getMonth() + 1,
            year = date.getFullYear();

        if (day < 10) {
            day = '0' + day;
        }
        if (month < 10) {
            month = '0' + month;
        }
        return parseInt(`${year}${month}${day}`);
    },
    checkDate = (() => {
        var lastDate,   //saving previous date
            lastDateInt;

        return () => {
            if (!lastDate) {
                lastDate = new Date();
                lastDateInt = getDateInt(lastDate);
                return lastDate;
            } else {
                let currentDate = new Date(),
                    currentDateInt = getDateInt(currentDate);

                if (currentDateInt === lastDateInt) {
                    return null;
                } else {
                    lastDate = currentDate;
                    lastDateInt = currentDateInt;

                    return lastDate;
                }
            }
        };
    })();
    
exports.checkDate = checkDate;

