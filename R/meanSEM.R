# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

meanSEM <- function(x,z){
  out <- data.frame(matrix(NA, ncol=4, nrow=72*length(z[,1])))
  part <- data.frame(matrix(0, ncol=4, nrow=72))
  part[,1] <- c(1:72)

  y <- as.matrix(z)

  for(i in 1:length(y[,1])){
    part[,2] <- y[i,4]

    a <- x[,,y[i,1]]

    s <- as.numeric(y[i,2]):as.numeric(y[i,3])

    if(is.na(y[i,5])){
      b <- a[,s]
    }

    else{
      t <- as.integer(unlist(strsplit(y[i,5],",")))
      u <- s[-which(s %in% t)]
      b <- a[,u]
    }

    part[,3] <- apply(b,1,mean)
    part[,4] <- apply(b,1,sd)/sqrt(length(b[1,]))

    out[(i*72-71):(i*72),] <- part
  }

  colnames(out) <- c("time", names(z)[4], "mean", "SEM")
  return(out)
}
