# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

hrsleep <- function(x){
	n <- length(x[,1,1])/60
  hr <- array(0, dim=c(n, 32, length(x[1,1,])))

  for(j in 1:length(x[1,1,])){

    for(i in 1:n) {
      a <- x[(i*60-59):(i*60),,j]
      hr[i,,j] <- apply(a,2,sum)
    }

  }
  dimnames(hr) <- dimnames(x)
  return(hr)
}

#Sleep deprivationやdTrpA1 stimulationの解析に使用
#hrsleepの結果（1時間ずつの3日分の睡眠）を引数とする
#1日目がbaseline、2日目のがSDなど、3日目がrebound
#2,3日目のsleepからbaselineを引いたものの積算を時系列で出力

SD <- function(x){
  delta <- array(0, dim=c(48, 32, length(x[1,1,])))
  for(j in 1:length(x[1,1,])){
    day1 <- x[1:24,,j]
    day2 <- x[25:48,,j]
    day3 <- x[49:72,,j]
    delta[,,j] <- rbind((day2-day1), (day3-day1))
    for(h in 1:32){
      for(i in 1:47){
        delta[i+1,h,j] <- delta[i,h,j] + delta[i+1,h,j]
      }
    }
  }
  return(delta)
}
