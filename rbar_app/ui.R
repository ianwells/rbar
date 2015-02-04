library(shiny)

demobars = c('Poison Girl' = 'POISON GIRL',
        'Catbirds' = 'CATBIRDS',
        'Anvil' = 'ANVIL',
        'Boondocks' = 'BOONDOCKS',
        'Stone\'s Throw' = 'STONES THROW',
        'Etro' = 'ETRO BAR',
        'Royal Oak' = 'ROYAL OAK',
        'Pistoleros' = 'PISTOLEROS',
        'Pastry War' = '310 BAR GROUP, L.L.C.',
        'Nightingale Room' = 'NIGHTINGALE ROOM BAR, L.L.C',
        'OKRA' = 'OKRA CHARITY SALOON, L.L.C.',
        'Lowbrow' = 'LOWBROW',
        'Fitzgerald\'s' = 'FITZGERALD\'S',
        'South Beach' = 'SOUTH BEACH',
        'Warren\'s' = 'WARREN\'S INN',
        'Batanga' = 'BATANGA',
        'Bad News Bar' = 'CAPTAIN FOXHEART\'S BAD NEWS BAR & SPIRIT LOUNGE',
        'Honeymoon' = 'THE HONEYMOON',
        'Little Dipper' = 'LITTLE DIPPER LOUNGE',
        'Moving Sidewalk' = 'GORO & GUN',
        'Notsuoh' = 'NO TSU OH',
        'Hearsay' = 'HEARSAY',
        'Kryptonite' = 'KRYPTONITE',
        'El Big Bad' = 'EL BIG BAD',
        'Barringer\'s' = 'BARRINGER\'S',
        'Sunny\'s' = 'SUNNY\'S',
        'State Bar' = 'THE STATE BAR AND LOUNGE',
        'Flying Saucer' = 'THE FLYING SAUCER DRAUGHT EMPO',
        'Public Services' = 'PUBLIC SERVICES BAR')   

shinyUI(fluidPage(

  # Application title
  titlePanel("TABC Gross Receipts"),
  plotOutput("tabcPlot"),  
  wellPanel(
    selectInput("bars", "Bar:",multiple = TRUE,
                demobars)
    )

))