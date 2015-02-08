library(shiny)

demoevents = c('OTC Week','FPSF','Rodeo','Baseball Season','Football Season','Basketball Season','Baseball Season','Hurricane Ike','Hurricane Rita','Hurricane Katrina','NBA All Star Game','MLB All Star Game','Superbowl XXXVIII','Haloween','New Years','Spring Break','School Year','Light Rail Opens','Restaurant Week','Pride Parade','Holidays')

demobars = c('Montrose (77006)' = 'Montrose (77006)',
             'Midtown (77004)' = 'Midtown (77004)',
             'Downtown (77002)' = 'Downtown (77002)',
             'Galleria (77056)' = 'Galleria (77056)',
             'Washington (77007)' = 'Washington (77007)',
             'Richmond Strip (77057)' = 'Richmond Strip (77057)',
             'Rice Village (77005)' = 'Rice Village (77005)',
        'Poison Girl' = 'POISON GIRL',
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
        'Public Services' = 'PUBLIC SERVICES BAR',
'Toyota Center' = 'LEVY RESTAURANTS AT TOYOTA CEN',
'Vic and Anthony\'s'='VIC AND ANTHONY\'S STEAKHOUSE',
'Hotel Za Za' = 'HOTEL ZA ZA',
'Reliant NRG Stadium' = 'ARAMARK SPORTS & ENTERTAINMENT',
'Pappas Bros. Steakhouse' = 'PAPPAS BROS STEAKHOUSE',
'Treasures' = 'TREASURES',
'Ruth\'s Chris' = 'RUTH\'S CHRIS STEAKHOUSE',
'Tony\'s' = 'TONY\'S',
'Minute Maid Park' = '9 AMIGOS/CRAWFORD STREET CAFE/' )    

shinyUI(fluidPage(

  # Application title
  titlePanel("TABC Gross Receipts"),
  plotOutput("tabcPlot"),  
  wellPanel(
    selectInput("bars", "Bars:",multiple = TRUE,
                demobars, width = '100%'),
    selectInput("events", "Events:",multiple = TRUE,
                demoevents, width = '100%'),
    dateRangeInput("daterange", label = "Date range:", start = as.Date('2001-01-01'), end = as.Date('2015-01-01'), min = as.Date('2001-01-01'), max = as.Date('2016-01-01'), format = "yyyy-mm-dd", startview = "month"),
    radioButtons("style", label = "Style",
                 choices = list("Lines" = 1, "Points" = 2), 
                 selected = 1)
    
    )

))