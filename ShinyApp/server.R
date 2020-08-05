#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(ggplot2)
data(diamonds)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot <- renderPlot({
    
        subdiamonds <- diamonds[diamonds$cut == input$cut &
                                diamonds$color == input$color &
                                diamonds$clarity == input$clarity 
                                ,]
        
        subdiamonds$group <- cut(subdiamonds$carat, c(0, 0.5, 1, 1.5, 2, 2.5,3,3.5,4,4.5,5))

        
        ggplot(data = subdiamonds, aes(x = group, y = price)) + 
            labs(x = "carats (range)") +
            geom_boxplot() + 
            coord_cartesian(ylim = c(0, 20000))

    })
    
    output$minprice <- renderText({
        subdiamonds <- diamonds[diamonds$cut == input$cut &
                                diamonds$color == input$color &
                                diamonds$clarity == input$clarity 
                                ,]
        min(subdiamonds$price)
        })
    output$maxprice <- renderText({
        subdiamonds <- diamonds[diamonds$cut == input$cut &
                                diamonds$color == input$color &
                                diamonds$clarity == input$clarity 
                                ,]
        max(subdiamonds$price)})

})
