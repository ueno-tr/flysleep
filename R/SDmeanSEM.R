##SDのグラフ作成のための計算
##3 day data (1:baseline, 2:SD, 3:rebound)
##DAMsleep1で出力されるhrsとエクセルデータを入力にする
##2,3 dayのデータをbaselineを差分し、累積値で出力

SDmeanSEM <- function(x,z){
  out <- data.frame(matrix(NA, ncol=4, nrow=48*length(z[,1])))
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

    c <- rbind((b[1:24,] - b[1:24,]), (b[25:48,] - b[1:24,]), (b[49:72,] - b[1:24,]))

    d <- c
    for(j in 1:length(c[1,])){
      d[,j] <- cumsum(c[,j])
    }

    part[,3] <- apply(d,1,mean)
    part[,4] <- apply(d,1,sd)/sqrt(length(d[1,]))

    out[(i*48-47):(i*48),] <- part[25:72,]
  }

  colnames(out) <- c("time", "genotype", "mean", "SEM")
  return(out)
}
