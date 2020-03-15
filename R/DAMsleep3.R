# Analyze fly sleep based on DAM data
# 3日分のデータから1日ずつの睡眠のグラフをプロット

DAMsleep3 <- function(hrs,n) { #1-3日のうち、除外する日をnとして入れる
  library(readxl)
  summary <- read_excel("summary.xls")

  out <- meanSEM(hrs, summary)
  out2 <- transform(out, hr=c(1:24), day=c(rep("day1",24),rep("day2",24),rep("day3",24)))
  out3 <- subset(out2, day!=paste("day",n, sep="")) #n日目を除外する

  ##グラフに出力
  library(ggplot2)
  p <- ggplot(out3, aes(x = hr, y = mean, group=interaction(genotype, day), colour=genotype, linetype=day) ) + geom_line() + ylab("sleep (min/hr)")

  errors <- aes(ymax = mean + SEM, ymin = mean - SEM)
  p <- p + geom_errorbar(errors, width = 0.2) + geom_point(size = 2)
  p

  ##pngファイルに出力
  ggsave(file = "sleep3graph.png", dpi = 100, width =12.336 , height =10 )
}
