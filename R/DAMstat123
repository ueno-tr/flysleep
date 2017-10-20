# Analyze Activity Index in Day 1,2,3 based on DAM data
#
# @param
#
# @return
#
# @export

DAMstat123 <- function(x,y) {

  out <- array(0, dim=c(9, 32, length(x[1,1,])))
  rownames(out) <- c("total acitivy counts Day1", "amount of time resting Day1", "waking activity index Day1", "total acitivy counts Day2", "amount of time resting Day2", "waking activity index Day2", "total acitivy counts Day3", "amount of time resting Day3", "waking activity index Day3")

  for(j in 1:length(x[1,1,])) {
    out[1,,j] <- apply(x[1:1440,,j], 2, sum)
    sleep1 <- apply(y[1:1440,,j], 2, sum)
    out[2,,j] <- sleep1/60
    out[3,,j] <- out[1,,j]/(1440-sleep1)

    out[4,,j] <- apply(x[1441:2880,,j], 2, sum)
    sleep2 <- apply(y[1441:2880,,j], 2, sum)
    out[5,,j] <- sleep5/60
    out[6,,j] <- out[4,,j]/(1440-sleep2)

    out[7,,j] <- apply(x[2881:4320,,j], 2, sum)
    sleep3 <- apply(y[2881:4320,,j], 2, sum)
    out[8,,j] <- sleep3/60
    out[9,,j] <- out[7,,j]/(1440-sleep3)
    }

    dimnames(out) <- list(rownames(out), colnames(out), dimnames(x)[[3]])

    ##配列から行列に変換
    b <- matrix(rep(paste("C", c(1:32), sep = "")),ncol=32)
    row.names(b) <- dimnames(out)[[3]][1]
    stat <- out[,,1]
    stat <- rbind(b,stat)

    for(i in 2:length(out[1,1,])) {
      row.names(b) <- dimnames(out)[[3]][i]
      stat <- rbind(stat,b,out[,,i])
    }

    return(stat)
  }
