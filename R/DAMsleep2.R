# Analyze fly sleep based on DAM data
#
# @param
#
# @return
#
# @export

DAMsleep2 <- function(hrs) {
  library(readxl)
  summary <- read_excel("summary.xls")

  out <- meanSEM(hrs, summary)
  exp <- names(summary)[4]

  ##グラフに出力
  library(ggplot2)
  p <- ggplot(out, aes(x = time, y = mean,group=exp, colour=exp) ) + geom_line() + ylab("sleep (min/hr)")

  errors <- aes(ymax = mean + SEM, ymin = mean - SEM)
  p <- p + geom_errorbar(errors, width = 0.2) + geom_point(size = 2)
  p

  ##pngファイルに出力
  ggsave(file = "sleep2graph.png", dpi = 200, width =15 , height =10 )
}
