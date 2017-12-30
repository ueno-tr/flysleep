## 32匹のダブルプロット
## importMarray2の後に使用

doubleplotall <- function(x) {
  for(j in 1:length(x[1,1,])){

    file.name  <- unlist(dimnames(x)[3])[j]
    pdf(paste(file.name, ".pdf", sep=""), width=11, height=8)

    par(oma = c(0, 0, 2, 0))
 	par(mfcol = c(20,16)) #8行1列の形でプロット出力
 	par(mai = c(0, 0.05, 0.1, 0)) #余白設定

 	for (i in 1:length(x[1,,j])) {
 		title <- sprintf("Line%d", i)
 		a <- x[1:2880,i,j]
 		barplot(a, main = title, axes=FALSE, xlab = NA, ylab = NA) #x軸に時間軸 y軸にx座標の値
 		for (k in 2:10) {
 			b <- x[((k-1)*1440 + 1):((k+1)*1440), i,j]
 			barplot(b, axes=FALSE, xlab = NA, ylab = NA)
 		}
    mtext(side = 3, line=0, outer=T, text =file.name, cex=1.5)
 		}
    dev.off()
  }
 		}
