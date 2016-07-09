# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

DAMsleep1 <- function() {
  Marray <- importMarray()
  barplotall(Marray)
  sleep <- act2sleep(Marray)
  hrs <- hrsleep(sleep)

  stat <- DAMstat(Marray, sleep)

  library(openxlsx)
  outDAM(hrs, stat)

  return(hrs)
}
