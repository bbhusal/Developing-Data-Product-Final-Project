library(shiny)
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Analysis of Gas Mielege Categorically"),
    
    sidebarPanel(
        selectInput("variable", " Select Variable:", 
                    c("Cylinders" = "cyl",
                      "Transmission" = "am",
                      "Gears" = "gear",
                      "Engine"="vs",
                      "Carburetor"="carb")),
        helpText("All the categorical varibles are taken from mtcars data in this variable selection 
        to provide informations about miles per gallon categorically in each aspect. 
                 ")
        
    ),
    
    mainPanel(
    #creating formatted text for header
    h4(textOutput("header")),
        #create tabs
        tabsetPanel(
            type="tab",
            tabPanel("Boxplot",plotOutput("mpgPlot")),
            tabPanel("Data",tableOutput("data"))
        )
        
    )
))
