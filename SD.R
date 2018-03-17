##SDのグラフを作成
##3 day data (1:baseline, 2:SD, 3:rebound)
##DAMsleep1で出力されるhrsを入力にする

SD <- function(hrs) {
  library(readxl)
  summary <- read_excel("summary.xls")

  out <- SDmeanSEM(hrs, summary)

  ##グラフに出力
  library(ggplot2)
  p <- ggplot(out, aes(x = time, y = mean,group=genotype, colour=genotype) ) + geom_line() + ylab("sleep (min/hr)")

  errors <- aes(ymax = mean + SEM, ymin = mean - SEM)
  p <- p + geom_errorbar(errors, width = 0.2) + geom_point(size = 2)
  p
}
