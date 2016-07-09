# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

DAMcompress <- function(){
  files <- list.files() #ディレクトリ内のファイル名をfilesに代入

  for (file.name in files) {
    if (regexpr('.txt$', file.name)  < 0) { # ファイル名の最後が '.txt'か？
      next                                 # そうでなければスキップ．
    }

    a <- read.table(file.name, sep="\t") #テキストデータ読み込み
    b <- length(a[,1]) #aの行数
    c <- a[(b-14400):b,] #最後10日分のデータのみ切り取る

    write.table(c, file.name, col.names=FALSE, row.names=FALSE, sep="\t", quote=FALSE)
  }
}
