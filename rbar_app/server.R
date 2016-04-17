library(shiny)
library(datasets)

library(ggplot2)
library(scales)

datafile <- './tabc_ts.csv'
eventsfile <- './events.csv'

d <- read.csv(datafile)
e <- read.csv(eventsfile)
d$date <- as.Date(d$date, '%Y-%m-%d')
e$begin <- as.Date(e$begin, '%Y-%m-%d')
e$end <- as.Date(e$end, '%Y-%m-%d')

plotBarLines <- function(barnames,eventnames,daterange,style)
{  
  print(barnames)
  bsub <- subset(d,d$name %in% barnames)
  esub <- subset(e,e$name %in% eventnames)
 
  if (style == 3) {
    plot = ggplot(data=bsub, mapping = aes(x=date,y=gross, colour = name, fill = name)) + 
      geom_area() + 
      xlab('') + 
      ylab('Gross Mixed Beverage Receipts ($)') + 
      ggtitle(paste("")) + 
      scale_y_continuous(labels=comma) + 
      scale_x_date(breaks = date_breaks("6 months"), labels = date_format("%m/%Y"), limits = daterange) + 
      theme(axis.text.x = element_text(angle = 45, vjust = 0.25, hjust=0.5),legend.title=element_blank()) 
  } else if (style == 2) {
    plot = ggplot(data=bsub, mapping = aes(x=date,y=gross, colour = name)) + 
      geom_smooth(method=loess)+ 
      geom_point() + 
      xlab('') + 
      ylab('Gross Mixed Beverage Receipts ($)') + 
      ggtitle(paste("")) + 
      scale_y_continuous(labels=comma) + 
      scale_x_date(breaks = date_breaks("6 months"), labels = date_format("%m/%Y"), limits = daterange) + 
      theme(axis.text.x = element_text(angle = 45, vjust = 0.25, hjust=0.5),legend.title=element_blank()) 
  } else if (style == 1) {
    plot = ggplot(data=bsub, mapping = aes(x=date,y=gross, colour = name)) + 
      geom_line() + 
      xlab('') + 
      ylab('Gross Mixed Beverage Receipts ($)') + 
      ggtitle(paste("")) + 
      scale_y_continuous(labels=comma) + 
      scale_x_date(breaks = date_breaks("6 months"), labels = date_format("%m/%Y"), limits = daterange) + 
      theme(axis.text.x = element_text(angle = 45, vjust = 0.25, hjust=0.5),legend.title=element_blank()) 
  }
  
  events <- geom_rect(data=esub, mapping = aes(xmin=begin, xmax=end), ymin=-Inf, ymax=+Inf, color="grey20", alpha=0.3, inherit.aes = FALSE)
  eventstext <- geom_text(data=esub, mapping = aes(x=begin,label=name),y=0, alpha=0.8, color = 'grey20', size=4, angle=90, vjust=-0.4, hjust=0)
  

  #for whatever reason, geom_rect doesn't like empty data
  if (nrow(esub) >= 1) {
    plot + events + eventstext
  } else {
    plot
  }
}

shinyServer(function(input, output) {  
  output$tabcPlot <- renderPlot({
    plotBarLines(input$bars,input$events,input$daterange,input$style)
  })
})
