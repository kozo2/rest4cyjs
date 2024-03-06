library(plumber)


# Title
#* @apiTitle resr4cyjs
# Description
#* @apiDescription This is a resr4cyjs API.
# Version
#* @apiVersion 0.0.1
# Tag Description
#* @apiTag resr4cyjs "resr4cyjs API"


#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  res$setHeader("Access-Control-Allow-Method", "GET")
  res$setHeader("Access-Control-Allow-Headers", "*")
  plumber::forward()
}


#* 画像を返すエンドポイント
#* @preempt cors
#* @serializer contentType list(type="image/png")
#* @get /test
function() {
  svg_file_path <- "./assets/test.png"
  readBin(svg_file_path, "raw", file.info(svg_file_path)$size)
}
