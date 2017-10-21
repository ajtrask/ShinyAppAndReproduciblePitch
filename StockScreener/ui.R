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
      'Try adding ", FB" or any other stock symbol'

    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("plot")
      )
    )
  ))
