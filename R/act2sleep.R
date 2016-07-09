# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

act2sleep <- function(x) {
  sleep <- array(0, dim=c(1440*3, 32, length(x[1,1,])))

  for(j in 1:length(x[1,1,])){

    for(i in 1:(1440*3-4)){
      a <- x[i:(i+4),,j]
      b <- apply(a,2,sum)

      for(h in 1:32){
        sleep[i,h,j] <- sleep[i,h,j] + (b[h] == 0) ##TRUEなら1足す
      }
    }

    sleep[4317:4320,,j] <- sleep[4316,,j]
  }
  dimnames(sleep) <- dimnames(x)
  return(sleep)
}
