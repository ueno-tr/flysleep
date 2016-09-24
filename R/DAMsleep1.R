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

  for(i in 1:length(hrs[1,1,])) {
    write.table(hrs[,,i], paste(unlist(dimnames(hrs)[3])[i], "sleep"), col.names=FALSE, row.names=TRUE, sep="\t", quote=FALSE)
  }

  write.table(stat, "stat", col.names=FALSE, row.names=TRUE, sep="\t", quote=FALSE)

  return(hrs)
}
