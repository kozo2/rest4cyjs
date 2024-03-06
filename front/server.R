shinyServer(function(input, output) {
    # NETWORK DATA ----
    tbl_nodes <- data.frame(id=c("A", "B", "C"),
                            type=c("Metabolite", "gene", "gene"),
                            color=c("green","orange","orange"),
                            size=c(10, 20, 30),
                            stringsAsFactors=FALSE)


    tbl_edges <- data.frame(source=c("A","A"),
                            target=c("B","C"),
                            interaction=c("inhibit", "stimulate"),
                            label = c("a","0.2"),
                            stringsAsFactors=FALSE)

    graph_json <- toJSON(dataFramesToJSON(tbl_edges,tbl_nodes ), auto_unbox=TRUE)

    output$cyjShiny <- renderCyjShiny({
        cyjShiny(graph_json, layoutName="cola",styleFile ="./www/style.json" )
    })
})
