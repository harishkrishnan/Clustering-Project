
shinyUI(pageWithSidebar(
  headerPanel('Heirarchical Clustering - A demonstration'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris)),
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    numericInput('clusters', 'Cluster count', 2,
                 min = 2, max = 9)
  ),
  mainPanel(
    plotOutput('plot1'),
    
    h4("Number of observations from the Iris dataset per cluster:"),
    verbatimTextOutput("summary")
      )
))
