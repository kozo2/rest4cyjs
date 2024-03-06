shinyUI(fluidPage(
  tags$head(
    #base setting
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
    tags$link(rel = "shortcut icon", href = "favicon.ico"),
    tags$title("rest4cyjs")
  ),
  div(class = "logo-field"),
  div(cyjShinyOutput('cyjShiny'))
))
