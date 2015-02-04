library(shiny)
library(datasets)

library(ggplot2)
library(scales)

datafile <- './tabc_ts_demo.csv'

d <- read.csv(datafile)
d$date <- as.Date(d$date, '%Y-%m-%d')

plotBarLines <- function(barnames,daterange)
{
  ggplot(data=subset(d,d$name %in% barnames), aes(x=date,y=gross, group = name, colour = name, linetype = name)) + geom_line() + xlab('') + ylab('Gross Mixed Beverage Receipts ($)') + ggtitle(paste("")) + scale_y_continuous(labels=comma) + scale_x_date(breaks = date_breaks("6 months"), labels = date_format("%m/%Y")) + theme(axis.text.x = element_text(angle = 45, vjust = 0.25, hjust=0.5))
}

shinyServer(function(input, output) {  
  output$tabcPlot <- renderPlot({
    plotBarLines(input$bars)
  })
})