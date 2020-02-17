library(shiny)
library(plotly)
library(ggplot2)

mpgData <- mtcars
mpgData$cyl <- factor(mpgData$cyl,labels = c("Four","Six","Eight"))
mpgData$am<- factor(mpgData$am,labels = c("Automatic","Manual"))
mpgData$vs <- factor(mpgData$vs, labels = c("V-shaped","Straight"))
mpgData$gear<- factor(mpgData$gear,labels = c("3","4","5"))
mpgData$carb<-factor(mpgData$carb,labels =c("1","2","3","4","6","8"))

shinyServer(function(input, output) {
    formulaText <- reactive({
        paste("Miles Per Gallon vs ", input$variable)
    })
    
    output$header <- renderText({
        formulaText()
    })
    
    
    output$mpgPlot <- renderPlot({
        ggplot(mpgData, aes_string(x=input$variable, y="mpg", fill= input$variable)) + geom_boxplot()+
            labs(title="Boxplots of Miles Per Gallon",x=input$variable, y="Miles Per Gallon")+
                     theme_classic()
                 
    })
        output$data<- renderTable({
            mpgData[,c("mpg",input$variable)]
        })
})
