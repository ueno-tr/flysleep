##SDのグラフを作成
##3 day data (1:baseline, 2:SD, 3:rebound)
##DAMsleep1で出力されるhrsを入力にする

SDgraph <- function(hrs) {
  library(readxl)
  summary <- read_excel("summary.xls")

  out <- SDmeanSEM(hrs, summary)

  ##グラフに出力
  library(ggplot2)
  p <- ggplot(out, aes_string(x = "time", y = "mean", group=names(out)[2], colour=names(out)[2]) ) + geom_line() + ylab("delta sleep (min/hr)")

  errors <- aes(ymax = mean + SEM, ymin = mean - SEM)
  p <- p + geom_errorbar(errors, width = 0.2) + geom_point(size = 2)
  p

  ##pngファイルに出力
  ggsave(file = "sleepSDgraph.png", dpi = 200, width =15 , height =10 )
}
