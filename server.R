#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot1 <- renderPlot({
    
    # generate the phase diagram from ui.R
    s <- input$s
    alpha <- input$alpha
    delta <- input$delta
    n <- input$n
    x <- input$x
    
    k0 <- seq(0,input$k0*3,input$k0*3/1000)
    t <- seq(0,100,0.1)
    
    k <- (((k0^(1-alpha))-(s/(delta+n+x)))*(exp(-(delta+n+x)*(1-alpha)*t) + s/(delta+n+x)))^(1/(1-alpha))
    kdot <- (s*k^(alpha))-(delta+n+x)*k
    
    # draw the line graph
    plot(k, kdot, type = "l")
    
  })
  
  output$plot2 <- renderPlot({
          
          # generate the phase diagram from ui.R
          s <- input$s
          alpha <- input$alpha
          delta <- input$delta
          n <- input$n
          x <- input$x
          
          k0 <- seq(0,input$k0,input$k0/1000)
          t <- seq(0,100,0.1)
          
          k <- ((k0^(1-alpha)-(s/(delta+n+x)))*(exp(-(delta+n+x)*(1-alpha)*t))+s/(delta+n+x))^(1/(1-alpha))
          
          # draw the line graph
          plot(t, k, type = "l")
          
  })
  
})
