
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {

  water_data <- read.csv('water_usage_by_ward.csv', header= FALSE)
  election_data <- read.csv('election_results_by_wards.csv')
  
  output$ward <- renderText({
    cbind('<h1>Ward ', input$ward, '</h1>')
  })
  
  output$res <- renderPlot({
    
    # generate bins based on input$bins from ui.R

    
    ward <- input$ward
    x    <- water_data[water_data$V1 == ward, 3]
       
    
    x <- as.numeric(gsub(",", "", x))
    y <- water_data[water_data$V1 == ward, 2] 
    
    
    
    # draw the histogram with the specified number of bins

    plot(y, x, xlab='Year', ylab='Number of Residential Accounts', main='Residential Water Usage Accounts')
    
    
  
    
    #barplot(t(election_data[,2:4][ward,]), beside=TRUE, xlab='Mayoral Candidates', names=c('Rob Ford', 'George Smitherman', 'Joe Pantalone'), space = 0.1, ylab='Votes', main="2010 Toronto Mayoral Results")
  })

  output$com <- renderPlot({
    
    
    ward <- input$ward
    x     <- water_data[water_data$V1 == ward, 6]
    
    x <- as.numeric(gsub(",", "", x))
    y <- water_data[water_data$V1 == ward, 2] 
    
    
    
    # draw the histogram with the specified number of bins
    
    plot(y, x, xlab='Year', ylab='Number of Commercial Accounts', main='Commercial Water Usage Accounts')
    
    
    
    
    #barplot(t(election_data[,2:4][ward,]), beside=TRUE, xlab='Mayoral Candidates', names=c('Rob Ford', 'George Smitherman', 'Joe Pantalone'), space = 0.1, ylab='Votes', main="2010 Toronto Mayoral Results")
  })
  
  output$election2010 <- renderPlot({
  
    ward <- input$ward
    barplot(t(election_data[,2:4][ward,]), beside=TRUE, xlab='Mayoral Candidates', names=c('Rob Ford', 'George Smitherman', 'Joe Pantalone'), space = 0.1, ylab='Votes', main="2010 Toronto Mayoral Results")
  })
  
  
})
