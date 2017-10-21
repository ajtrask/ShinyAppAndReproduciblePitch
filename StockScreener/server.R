#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(tidyquant)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$plot <- renderPlot({
    
    # parse list of stocks from input
    stocks <- trimws(unlist(strsplit(input$stocks,",")))

    # Get returns for individual stock components grouped by symbol
    df <- c(stocks,"SPY") %>%
      tq_get(get = "stock.prices") %>%
      group_by(symbol) %>%
      mutate(total.return = adjusted/adjusted[1]*100)

    # generate the plot
    ggplot(df, aes(x=date,y=total.return,color=symbol)) +
      geom_line()
  })

})
