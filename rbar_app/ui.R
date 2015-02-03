library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("TABC Gross Receipts"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("bar", "Bar:",
                list("Anvil" = "ANVIL", 
                     "Catbirds" = "CATBIRDS"))
    
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    plotOutput("tabcPlot")
  )
))