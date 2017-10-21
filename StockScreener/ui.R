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
  # Application title
  titlePanel("Stock Returns"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput("stocks","Stocks (comma seperated):","AAPL,GOOG"),
      'Add to or replace the list of stock symbols in the the text box above.  Try adding ", FB" for Facebook.  The plot will update with the total return since the beginning of the available data.'

    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      'The plot updates with the total return from the beginning of the available data for each symbol.  Stock price data is retrieved from Yahoo Finance using the tidyquant package and the total return is calculated.',
      plotlyOutput("plot"),
      'The symbol "SPY" closely tracks the S&P 500 for an indication of general market performance.'
      )
    )
  ))
