##SDのグラフを作成
##3 day data (1:baseline, 2:SD, 3:rebound)
##DAMsleep1で出力されるhrsを入力にする

pptx <- function(file) {
  library("officer")
  library("dplyr")

  files <- list.files(pattern = "png$") #ディレクトリ内のpngファイル名（"png$"で絞り込み）をfilesに代入

  #パワポのファイルを作成する
  pptx_file <- "sleep_result.pptx"
  pptx_file_path <- paste(pptx_file, sep = "/")

  #ファイル内にかきこみ始める
  my_pres <- read_pptx()%>%
  #タイトルページ
  add_slide(layout = "Title Slide", master = "Office Theme") %>%
  ph_with_text(type = "ctrTitle", str = "タイトル") %>%
  ph_with_text(type = "subTitle", str = "file/name") %>%

  for (i in 1:length(files)) {
    file.name <- files[i]
  #グラフのページ
  #1ページ目
  add_slide(layout = "Title Only", master = "Office Theme")%>%
  ph_with_text(type = "title", str = "sleep2graph",index = 1)%>%
  ph_with_img_at(src = file.name, left = 0, top = 1.5, width = 10, height = 6)%>%
  
  #ファイル出力(保存する)
  print(target = pptx_file_path) %>%
  invisible()
}