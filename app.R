#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# @author Peter Meissner retep.meissner@gmail.com


#### GLOBAL ####################################################################

library(shiny)




#### UI ########################################################################
ui <- 
  basicPage(
    tags$head(
      tags$script(src="scale_svg_text.js"),
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    
    # first histogram
    tags$div(
      style = "width: 20%; height: 96%; top: 1%; left:  20%;",
      class = "absolute",
      plotOutput("hist_1", width = "100%", height = "100%")
    ),
    
    # second hsitogram
    tags$div(
      style="width: 57%; left: 41%; top: 1%; height: 96%;",
      class = "absolute",
      plotOutput("hist_2", width = "100%", height = "100%")
    ),
    
    
    # scaled text 1 
    tags$div(
      style="width: 18%; left: 1%; top: 1%; height: 20%;",
      class = "absolute",
      uiOutput("time")
    ),
    
    # scaled text 2
    tags$div(
      style="width: 18%; left: 1%; top: 22%; height: 20%;",
      class = "absolute",
      div(
        style="width:100%; height:100%",
        tag(
          "svg",
          varArgs = list(tag("text", varArgs = list("Scale ") ))
        )
      )
    ),
    
    # scaled text 3
    tags$div(
      style="width: 18%; left: 1%; top: 43%; height: 54%;",
      class = "absolute",
      div(
        style="width:100%; height:100%",
        tag(
          "svg",
          varArgs = list(tag("text", varArgs = list("text") ))
        )
      )
    )
    
  )




#### SERVER ####################################################################

server <- function(input, output) {
  
  # histogram 1 
  output$hist_1 <- 
    renderPlot({
      par(mar=c(0,0,0,0))
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = 10)
      hist(x, breaks = bins, col = 'grey20', border = 'white', main = NULL, xlab = NULL, ylab=NULL, axes =FALSE)
    })
  
  # histogram 2
  output$hist_2 <- 
    renderPlot({
      par(mar=c(0,0,0,0))
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = 10)
      hist(x, breaks = bins, col = 'grey20', border = 'white', main = NULL, xlab = NULL, ylab=NULL, axes =FALSE)
    })
  
  # text 3 
  output$time <- 
    renderUI({
      div(
        style="width:100%; height:100%",
        tag(
          "svg",
          varArgs = 
            list(
              tag(
                "text", 
                varArgs = 
                  list( 
                    as.character(Sys.time(), "%H:%M:%S")
                  ) 
              ) 
            )
        )
      )
    })
}



#### RUN APP ###################################################################
shinyApp(ui = ui, server = server)

