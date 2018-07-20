# @author Peter Meissner retep.meissner@gmail.com


#### GLOBAL ####################################################################

library(shiny)

# absolute box 
absolute_box <- function(text, x1, x2, y1, y2){
  tags$div(
    style =
      sprintf(
        fmt = "left: %s%%; top: %s%%; width: %s%%; height: %s%%;", 
        x1, y1, x2 - x1, y2 - y1
      ),
    class = "absolute",
    div(
      style = "width: 100%; height: 100%",
      text
    )
  )
}

# scaled text function
scaled_text_output <- function(text, x1, x2, y1, y2){
  absolute_box(
    tag("svg", varArgs = list(tag("text", varArgs = list(text)))),
    x1, x2, y1, y2
  )
}

# a simple histogram plotting function
my_histogram <- function(){
  # save and restore plot parameter
  par_mar_tmp <- par("mar")
  on.exit(
    par(mar = par_mar_tmp)
  )

  # set plot parameter
  par(mar  = c(0,0,0,0) )
  
  # plot
  hist(
    x      = faithful$waiting, 
    breaks = seq(min(faithful$waiting), max(faithful$waiting), length.out = 10), 
    col    = 'grey20',
    border = 'white', 
    main   = NULL, 
    xlab   = NULL, 
    ylab   = NULL, 
    axes   = FALSE
  )
}


#### UI ########################################################################
ui <- 
  basicPage(
    
    # including Javascript code and a style sheet
    tags$head(
      tags$script(src = "scale_svg_text.js"),
      tags$link(  rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    
    # histograms
    absolute_box(
      plotOutput("hist_1", width = "100%", height = "100%"), 
      x1 = 1, x2 = 20, y1 = 21, y2 = 99
    ),

    absolute_box(
      plotOutput("hist_2", width = "100%", height = "100%"), 
      x1 = 21, x2 = 99, y1 = 21, y2 = 99
    ),
    
    # scaled text
    scaled_text_output("This",  1, 20, 1, 20),
    scaled_text_output("is scaled", 21, 61, 1, 20),
    scaled_text_output("text", 62, 99, 1, 20)
  )


#### SERVER ####################################################################

server <- function(input, output) {
  output$hist_1 <- renderPlot({my_histogram()})
  output$hist_2 <- renderPlot({my_histogram()})
}


#### RUN APP ###################################################################
shinyApp(ui = ui, server = server)

