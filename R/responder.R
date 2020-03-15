##Responderの解析
##1時間ごとに刺激した場合を想定（XX:00に刺激）
##刺激前5分間活動のないものを評価
##刺激後、1分以上の活動が見られたものを反応ありと見なす
##反応が見られたものは活動の持続時間（5分以上の休息まで）も評価
##XX:56~XX:55のデータをDAMfileScanで抽出する
##XX:56~XX:00のデータがpreのデータ
##1時間ごとに切り出して解析

responder <- function(){
  Marray <- importMarray2()

  out <- array(0, dim=c((length(Marray[,1,1]))/60, 32, length(Marray[1,1,]))) #時間数に合わせて配列作成 non-responderは0、pre5分が活動だったらNA
  rownames(out) <- c(1:((length(Marray[,1,1]))/60))

  for(j in 1:length(Marray[1,1,])){

    for(i in 1:((length(Marray[,1,1]))/60)) {
      a <- Marray[((i-1)*60+1):(i*60),,j] #1hr分のデータ切り出し
      b <- apply(a[1:5,],2,sum) #XX:56~XX:00のデータの和
      c <- a[6:60,]

      for(n in 1:32){
        if(b[n] != 0){ #pre5分が活動だったらNAを入れる
          out[i,n,j] <- NA
        }

        if(b[n] == 0 && c[1,n] != 0){ #pre5分が休息かつ刺激後1分で活動
          d <- cumsum(c[,n]) ##5分連続で0を検出するために、累積値を計算

          if(min(d[6:55] - d[1:50]) == 0){ ##5分連続で0になっているところがあるか
          out[i,n,j] <- min(which((d[6:55] - d[1:50]) == 0)) ##5分連続で0になっているところを採用
        }
        else{
          out[i,n,j] <- 50
        }
        }
      }
    }
  }

  dimnames(out) <- list(rownames(out), colnames(out), dimnames(Marray)[[3]])
  ##配列から行列に変換
  e <- matrix(rep(paste("C", c(1:32), sep = "")),ncol=32)
  row.names(e) <- dimnames(out)[[3]][1]
  stat <- out[,,1]
  stat <- rbind(e,stat)

  for(i in 2:length(out[1,1,])) {
    row.names(e) <- dimnames(out)[[3]][i]
    stat <- rbind(stat,e,out[,,i])
  }

  write.table(stat, "responder.txt", col.names=FALSE, row.names=TRUE, sep="\t", quote=FALSE)
}
