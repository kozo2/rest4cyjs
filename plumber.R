#* @serializer contentType list(type="image/png")
#* @get /test
function() {
  svg_file_path <- "./test.png"
  readBin(svg_file_path, "raw", file.info(svg_file_path)$size)
}
