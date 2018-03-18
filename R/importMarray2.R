# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

importMarray2 <- function() {

  files <- list.files(pattern = "CtM....txt$") #ディレクトリ内のDAMファイル名（"CtM....txt$"で絞り込み）をfilesに代入

  s <- data.matrix(read.table(files[1], sep="\t")) #文字などが入っているためscanが使えない　44列データになる
  t <- array(0, dim=c(length(s[,1]), 32, length(files))) #行数に合わせて設定

  for (i in 1:length(files)) {
    file.name <- files[i]

    if (regexpr('.txt$', file.name)  < 0) { # ファイル名の最後が '.txt'か？
      next                                 # そうでなければリストから削除してスキップ．
    }

    a <- data.matrix(read.table(file.name, sep="\t")) #文字などが入っているためscanが使えない　44列データになる
    b <- a[,11:42] #最初10列を削除
    colnames(b) <- NULL #列の名前を取り除く

    t[,,i] <- b
  }

  ##filesの名前をM022などにする（1604282226CtM022.txtと言う名前を想定）
  ##後ろから8文字目~後ろから5文字目
  for (i in 1:length(files)){
    files[i] <- substring(files[i],nchar(files[i])-7,nchar(files[i])-4)
  }

  ##三次元目の名前をモニター番号にする
  dimnames(t) <- list(rownames(t), colnames(t), files)

  return(t)
}
