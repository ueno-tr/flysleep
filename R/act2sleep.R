# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

act2sleep <- function(x) {
	n <- length(x[,1,1])
  sleep <- array(0, dim=c(n, 32, length(x[1,1,])))

  for(j in 1:length(x[1,1,])){

    for(i in 1:(n-4)){
      a <- x[i:(i+4),,j]
      b <- apply(a,2,sum)

      for(h in 1:32){
        sleep[i,h,j] <- sleep[i,h,j] + (b[h] == 0) ##TRUEなら1足す
      }
    }

    sleep[(n-3):n,,j] <- sleep[n-4,,j]
  }
  dimnames(sleep) <- dimnames(x)
  return(sleep)
}
