
shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[1:50, c(input$xcol, input$ycol)]
  })
  
    hclusters <- reactive({
    distance <- dist(selectedData(),method="euclidean")
    hclust(distance, method = "ward.D")
  })
  
  output$plot1 <- renderPlot({
        plot(hclusters(), main = "Heirarchical Cluster Dendrogram",xlab = "Distances")
        rect.hclust(hclusters(), k = input$clusters, border = "red")
         
  })

  
  output$summary <- renderPrint({
    
    k <- cbind(selectedData(),cutree(hclusters(), k = input$clusters))
    colnames(k) <- c(input$xcol,input$ycol,"Cluster")
    
    table(cutree(hclusters(), k = input$clusters))
    
  })
  
  
  
})