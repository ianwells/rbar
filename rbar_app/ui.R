library(shiny)

demoevents = c('OTC Week','FPSF','Rodeo','Baseball Season','Football Season','Basketball Season','Baseball Season','Hurricane Ike','Hurricane Rita','Hurricane Katrina','NBA All Star Game','MLB All Star Game','Superbowl XXXVIII','Halloween','New Years','Spring Break','School Year','Light Rail Opens','Restaurant Week','Pride Parade','Holidays')

b = lapply(read.csv('./bars.csv')[,'name'], as.character)

shinyUI(fluidPage(

  # Application title
  titlePanel("TABC Gross Receipts"),
  plotOutput("tabcPlot"),  
  wellPanel(
    selectInput("bars", "Select Bars (autocomplete on name):",multiple = TRUE,
                b, width = '100%'),
    selectInput("events", "Select Events:",multiple = TRUE,
                demoevents, width = '100%'),
    dateRangeInput("daterange", label = "Date range:", start = as.Date('2003-01-01'), end = as.Date('2016-01-01'), min = as.Date('2001-01-01'), max = as.Date('2016-01-01'), format = "yyyy-mm-dd", startview = "month"),
    radioButtons("style", label = "Style",
                 choices = list("Lines" = 1, "Points" = 2, "Stacked" = 3), 
                 selected = 1),
    h5("Code and data on github.com/ianwells/rbar."),
    h6("Civic data from http://www.window.state.tx.us/taxinfo/taxfiles.html"),
    h6("The Comptroller of Public Accounts cannot vouch for the data or analysis derived from data after it has been retrieved from the Comptroller's Web site.")

    
    
    )

))