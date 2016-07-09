# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

hrsleep <- function(x){
  hr <- array(0, dim=c(72, 32, length(x[1,1,])))

  for(j in 1:length(x[1,1,])){

    for(i in 1:72) {
      a <- x[(i*60-59):(i*60),,j]
      hr[i,,j] <- apply(a,2,sum)
    }

  }
  dimnames(hr) <- dimnames(x)
  return(hr)
}
