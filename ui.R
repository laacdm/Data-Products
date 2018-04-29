#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  h4("Luis A Alaniz Castillo, 26 of april 2018"),

  p("The following shows the solution for the Solow Growth model with exogenous technological change . The model asumes a closed economy with a constant 
    savings rate (denoted by s), a constant population growth rate (denoted by n), a constant technological change growth rate (denoted by x), a constant depreciation (denoted by delta) and a Cobb-Douglas production 
    function with constant returns to scale (capital share in output denoted by alpha). Model time is years. For more details read chapter 1 of Barro and Sala-i-Martin, Economic Growth (2004)"),
  
  withMathJax(),
  helpText("This is the equation for the transitional dynamics of the capital stock (first graph) which can be solved analytically: $$\\dot{k} = sk^{\\alpha}-(\\delta+n+x)k$$"),
  helpText("This is the equation for the equilibrium path of the capital stock (second graph) and the analytical solution of the equation above: $$k = (((k_{0}^{(1-\\alpha)}-\\frac{s}{(\\delta+n+x)})e^{-(1-\\alpha)(\\delta+n+x)t})+\\frac{s}{(\\delta+n+x)})^{\\frac{1}{(1-\\alpha)}}$$"),
  
  p("Move the sliders to change the values of the parameters metioned above and see what happens in equilibrium"),
  
  # Application title
  titlePanel("Solow Growth Model Transitional Dynamics of the Capital Stock in Efective Units"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h3("Initial Capital Stock"),
        numericInput("k0", "Choose an initial capital stock:", min = 0, max = 6, value = 1.5, step = 0.1),
        h3("Savings rate"),
        sliderInput("s", "Choose the savings rate:", min = 0.001, max = 0.999, value = 0.2, step = 0.01),
        h3("Capital share in output"),
        sliderInput("alpha", "Choose the capital share in output:", min = 0.001, max = 0.999, value = 0.4, step = 0.01),
        h3("Depreciation rate"),
        sliderInput("delta", "Choose the depreciation rate:", min = 0.001, max = 0.999, value = 0.1, step = 0.01),
        h3("Population growth rate"),
        sliderInput("n", "Choose the population growth rate:", min = 0, max = 0.1, value = 0.018, step = 0.001),
        h3("Technological progress growth rate"),
        sliderInput("x", "Choose the technological progress growth rate:", min = 0, max = 0.1, value = 0.03, step = 0.001)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Transition Function of the Capital Stock"),
       plotOutput("plot1"),
       h3("Equilibrium of Path of the Capital Stock over Time"),
       plotOutput("plot2")
    )
  )
))
