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
cors <- function(req, res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods", "*")
    res$setHeader(
      "Access-Control-Allow-Headers",
      req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS
    )
    res$status <- 200
    return(list())
  } else {
    plumber::forward()
  }
}


#* 画像を返すエンドポイント
#* @serializer contentType list(type="image/png")
#* @get /test
function() {
  svg_file_path <- "./assets/test.png"
  readBin(svg_file_path, "raw", file.info(svg_file_path)$size)
}

#* Example of customizing graphical output
#* @serializer png list(width = 400, height = 500)
#* @get /
function(){
  plot(1:10)
}