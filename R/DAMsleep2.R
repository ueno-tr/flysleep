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

  ##グラフに出力
  library(ggplot2)
  p <- ggplot(out, aes_string(x = "time", y = "mean", group = names(out)[2], colour = names(out)[2])) + geom_line() + ylab("sleep (min/hr)")

  errors <- aes(ymax = mean + SEM, ymin = mean - SEM)
  p <- p + geom_errorbar(errors, width = 0.2) + geom_point(size = 2)
  p

  ##pngファイルに出力
  ggsave(file = "sleep2graph.png", dpi = 200, width =15 , height =10)
}
