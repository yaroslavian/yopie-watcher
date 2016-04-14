transformDate = (date) ->
  day = date.getDate()
  if day < 10 then day = "0#{day}"
  month = date.getMonth()+1
  if month < 10 then month = "0#{month}"
  year = date.getFullYear()
  result = parseInt "#{year}#{month}#{day}"

dateKeeper = ->
  lastDate = undefined
  lastDateInt = undefined
  return () ->
    if !lastDate
      lastDate = new Date()
      lastDateInt = transformDate(lastDate)
      return lastDate
    else
      currentDate = new Date()
      currentDateInt = transformDate(currentDate)
      if currentDateInt == lastDateInt
        return null
      else
        lastDate = currentDate
        lastDateInt = currentDateInt
        return lastDate

checkDate = do dateKeeper

exports.checkDate = checkDate
