## 各群の平均でのダブルプロット
## importMarray2の後に使用
## summary.xlsを使用
## barplotallの結果をみてsummary.xlsにいれておく
## 引数xにimportMarray2の結果
## 引数expに実験名を""を付けて入れる（例："171226-180106_25LDDD"）

doubleplotsummary <- function(x,exp) {
  library(readxl)
  summary <- as.matrix(read_excel("summary.xls"))

  mean <- matrix(NA, ncol=length(summary[,1]), nrow=length(x[,1,1]))

  for(i in 1:length(summary[,1])){
    a <- x[,,summary[i,1]]
    s <- as.numeric(summary[i,2]):as.numeric(summary[i,3])

    if(is.na(summary[i,5])){
      b <- a[,s]
    }

    else{
      t <- as.integer(unlist(strsplit(summary[i,5],",")))
      u <- s[-which(s %in% t)]
      b <- a[,u]
    }

    mean[,i] <- apply(b,1,mean)
  }

  colnames(mean) <- summary[,4] ##列名をgenotypeにする

  ##以下、描出し、pdf保存
  pdf(paste("doubleplot_summary", ".pdf", sep=""), width=11, height=8)

  par(oma = c(0, 0, 2, 0))
  par(mfcol = c(20,6)) #10行6列の形でプロット出力 1ページで12ライン
  par(mai = c(0, 0.05, 0.1, 0)) #余白設定

  for (i in 1:length(mean[1,])) {
    title <- colnames(mean)[i]
    a <- mean[1:2880,i]
    barplot(a, main = title, axes=FALSE, xlab = NA, ylab = NA) #x軸に時間軸 y軸にx座標の値
    for (k in 2:10) {
      b <- mean[((k-1)*1440 + 1):((k+1)*1440), i]
      barplot(b, axes=FALSE, xlab = NA, ylab = NA)
    }
    mtext(side = 3, line=0, outer=T, text =exp, cex=1.5)
    }
    dev.off()

  }
