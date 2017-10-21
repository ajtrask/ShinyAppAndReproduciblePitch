Stock Screener Application
========================================================
author: Aaron Trask
date: 10/21/2017
autosize: true

Features
========================================================

- **Visual:** stock performance at a glance
- **Customizable:** choose your stocks
- **Informative:** compare between stocks

Tidyverse
========================================================

Leverages the ***tidyquant*** package to retrieve up to date stock data from Yahoo Finance.

```r
library(tidyquant)
# get stock prices
df <- c('AAPL','GOOG') %>% tq_get(get = "stock.prices") %>%
      group_by(symbol) %>% mutate(total.return = adjusted/adjusted[1]*100)
head(df)
```

```
# A tibble: 6 x 9
# Groups:   symbol [1]
  symbol       date     open     high      low    close    volume adjusted
   <chr>     <date>    <dbl>    <dbl>    <dbl>    <dbl>     <dbl>    <dbl>
1   AAPL 2007-01-03 12.32714 12.36857 11.70000 11.97143 309579900 10.77017
2   AAPL 2007-01-04 12.00714 12.27857 11.97429 12.23714 211815100 11.00922
3   AAPL 2007-01-05 12.25286 12.31428 12.05714 12.15000 208685400 10.93082
4   AAPL 2007-01-08 12.28000 12.36143 12.18286 12.21000 199276700 10.98480
5   AAPL 2007-01-09 12.35000 13.28286 12.16429 13.22429 837324600 11.89731
6   AAPL 2007-01-10 13.53571 13.97143 13.35000 13.85714 738220000 12.46666
# ... with 1 more variables: total.return <dbl>
```

ggplot2
========================================================

Visualization using the ***ggplot2*** package for exploration.


```r
library(ggplot2)
ggplot(df, aes(x=date,y=total.return,color=symbol)) +
  geom_line()
```

<img src="StockScreenerPitch-figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />


Accessing the Application
========================================================
To access the Shiny application, please visit <https://ajtrask.shinyapps.io/StockScreener/>
