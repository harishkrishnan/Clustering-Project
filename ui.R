
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
    verbatimTextOutput("summary"),
    
    h5("The above app helps one understand the concept of Heirarchical Clustering. 
       Choose the X and Y vairable and the number of clusters on the left. The
       Dendrogram on the right can be imagined as a tree and the observations based on the
       similarities and dissimilarities are clustered into groups. The clustered observations
       will have a lot commonalities relative to each other.")
      )
))
