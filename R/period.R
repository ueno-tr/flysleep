# Analyze fly sleep based on DAM data
# chi-square periodgramを求めるxspパッケージを用いて、リズムを解析
# input DAMの生データとエクセルファイル
# 描画の結果をPDFファイルに出力し、ファイル名をgenotypeにする

period <- function() {
  library(readxl)
  library(xsp)
  library(ggplot2)

  summary <- read_excel("summary.xls")
  summary.m <- as.matrix(summary)

  Marray <- importMarray()

  for(i in 1:length(summary.m[,1])) {
    genotype <- summary.m[i,4]
    a <- Marray[,,summary.m[i,1]]
    s <- as.numeric(summary.m[i,2]):as.numeric(summary.m[i,3])

    if(is.na(summary.m[i,5])){
      b <- a[,s]
    }
    else{
      t <- as.integer(unlist(strsplit(summary.m[i,5],",")))
      u <- s[-which(s %in% t)]
      b <- a[,u]
    }

  oscillation <- apply(b,1,mean)

  oscillation.df <- data.frame(dateTime = 1:length(oscillation), value = oscillation)
  chiSqPeriodogramPlot(chiSqPeriodogram(oscillation.df, res=0.1))

  ggsave(file=paste(genotype, ".pdf", sep=""))

  }

}
