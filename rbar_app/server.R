library(shiny)
library(datasets)

library(ggplot2)
library(scales)

datafile <- './tabc_ts_small.csv'

d <- read.csv(datafile)

plotBar <- function(barname)
{
  ggplot(data=subset(d,d$name == barname), aes(x=date,y=gross)) + geom_smooth(method = 'loess', aes(group=1)) + geom_point()+xlab('Year') + ylab('Gross Mixed Beverage Receipts ($)') + ggtitle(paste(barname, "Monthly Receipts (with fit)")) + scale_y_continuous(labels=comma)
}


# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  output$tabcPlot <- renderPlot({
    plotBar(input$bar)
  })
})