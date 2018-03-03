#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
par(mar=c(0,0,0,0))

# Define UI for application that draws a histogram
ui <- 
  basicPage(
    tags$div(
        style="border: 1px solid black; position: absolute; width:20%; height: 69%; top: 1%",
        plotOutput("distPlot", width = "100%", height = "100%")
      ),
    tags$div(
      style="border: 1px solid black; position: absolute; width:60%; top: 70%; height: 28%;",
      plotOutput("distPlot2", width = "100%", height = "100%")
    ),
    tags$div(
      style="border: 1px solid black; position: absolute; width:79%; left: 21%; top: 1%; height: 69%;",
      plotOutput("distPlot3", width = "100%", height = "100%")
    ),
    tags$div(
      style="border: 1px solid black; position: absolute; left:61%; width:38%; top: 70%; height: 28%;",
      plotOutput("distPlot4", width = "100%", height = "100%")
    )
  )

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     par(mar=c(0,0,0,0))
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = 10)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'grey20', border = 'white', main = NULL, xlab = NULL, ylab=NULL, axes =FALSE)
   })
   
   output$distPlot3 <- renderPlot({
     par(mar=c(0,0,0,0))
     # generate bins based on input$bins from ui.R
     x    <- faithful[, 2] 
     bins <- seq(min(x), max(x), length.out = 10)
     
     # draw the histogram with the specified number of bins
     hist(x, breaks = bins, col = 'grey20', border = 'white', main = NULL, xlab = NULL, ylab=NULL, axes =FALSE)
   })
   
   output$distPlot4 <- renderPlot({
     par(mar=c(0,0,0,0))
     # generate bins based on input$bins from ui.R
     x    <- faithful[, 2] 
     bins <- seq(min(x), max(x), length.out = 10)
     
     # draw the histogram with the specified number of bins
     hist(x, breaks = bins, col = 'grey20', border = 'white', main = NULL, xlab = NULL, ylab=NULL, axes =FALSE)
   })
   
   output$distPlot2 <- renderPlot({
     par(mar=c(0,0,0,0))
     # generate bins based on input$bins from ui.R
     x    <- faithful[, 2] 
     bins <- seq(min(x), max(x), length.out = 10)
     
     # draw the histogram with the specified number of bins
     hist(x, breaks = bins, col = 'grey20', border = 'white', main = NULL, xlab = NULL, ylab=NULL, axes =FALSE)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

