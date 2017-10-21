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
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # renderPlotly() also understands ggplot2 objects!
  output$plot <- renderPlotly({
    
    # parse list of stocks from input
    stocks <- trimws(unlist(strsplit(input$stocks,",")))

    # determine what metric to use perform calculations
    #if(input$metric == 0) {
    #  df <- stocks %>%
    #    tq_get(get = "stock.prices") %>%
    #    group_by(symbol) %>%
    #    tq_transmute(adjusted, quarterlyReturn)
    #  plot_ly(data = df, x = ~date, y = ~quarterly.returns, color = ~symbol)
    #} else {
    #  df <- stocks %>%
    #    tq_get(get = "stock.prices") %>%
    #    group_by(symbol) %>%
    #    tq_transmute(adjusted, annualReturn)
    #  plot_ly(data = df, x = ~date, y = ~yearly.returns, color = ~symbol)
    #}

    
    # Get returns for individual stock components grouped by symbol
    df <- c(stocks,"SPY") %>%
      tq_get(get = "stock.prices") %>%
      group_by(symbol) %>%
      mutate(total.return = adjusted/adjusted[date == '2007-01-03'])

    # generate the interactive plot
    plot_ly(data = df, x = ~date, y = ~total.return, color = ~symbol)
    
    #  add_lines(y = ~Ra, name = ~symbol) %>%
    #  add_lines(y = ~Rb, name = "S&P 500")
    #  layout(
    #    title = "Closing Stock Price",
    #    xaxis = list(domain = c(0.1, 1)),
    #    yaxis = list(title = "Price ($)"),
    #    updatemenus = list(
    #      list(
    #        y = 0.7,
    #        buttons = list(
    #          list(method = "restyle",
    #               args = list("visible", list(TRUE, FALSE)),
    #               label = "AAPL"),
    #          
    #          list(method = "restyle",
    #               args = list("visible", list(FALSE, TRUE)),
    #               label = "GOOG")))
    #    )
    #  )
  })

})
