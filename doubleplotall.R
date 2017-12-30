## 32匹のダブルプロット
## importMarray2の後に使用

doubleplotall <- function(x) {
 	par(mfcol = c(20,16)) #8行1列の形でプロット出力
 	par(mai = c(0, 0.05, 0.1, 0)) #余白設定
 	for (i in 1:length(x[1,])) {
 		title <- sprintf("Line%d", i)
 		a <- x[1:2880,i]
 		barplot(a, main = title, axes=FALSE, xlab = NA, ylab = NA) #x軸に時間軸 y軸にx座標の値
 		for (j in 2:10) {
 			b <- x[((j-1)*1440 + 1):((j+1)*1440), i]
 			barplot(b, axes=FALSE, xlab = NA, ylab = NA)
 		}
 		}
 		}
