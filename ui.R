
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("City of Toronto Ward Data"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    p("Please slide the slider to choose the Toronto Ward you wish to select!"),
    sliderInput("ward",
                "Toronto Ward:",
                min = 1,
                max = 44,
                value = 1),
    p("Github Repo: https://github.com/king-kong/DataProductsAssignment")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    htmlOutput("ward"),
    plotOutput("res"),
    plotOutput("com"),
    plotOutput("election2010")
  )
))
