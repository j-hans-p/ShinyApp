#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data(diamonds)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Diamond Price Predictor"),
    

    # Sidebar with a slider input diamond characteristics
    sidebarLayout(
        sidebarPanel(
            h4("This app uses the ggplot2 Diamonds dataset to display expected prices of diamonds"),
            h6("Select diamond attributes (cut, color, and clarity) to see likely price range by diamond size (carat)"),
            #sliderInput("carats", "Carats:",
            #            min = 0.5,max = 3, value = 1.5, step = 0.25),
            radioButtons("cut", "Cut:",
                         c("Fair" = "Fair",
                           "Good" = "Good",
                           "Very Good" = "Very Good",
                           "Premium" = "Premium",
                           "Ideal" = "Ideal")),
            radioButtons("color", "Color:",
                         c("D" = "D",
                           "E" = "E",
                           "F" = "F",
                           "G" = "G",
                           "H" = "H",
                           "I" = "I",
                           "J" = "J"
                           )),
            radioButtons("clarity", "Clarity:",
                         c("I1" = "I1",
                           "SI2" = "SI2",
                           "SI1" = "SI1",
                           "VS2" = "VS2",
                           "VS1" = "VS1",
                           "VVS2" = "VVS2",
                           "VVS1" = "VVS1",
                           "IF" = "IF"
                         ))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           
            plotOutput("plot"),
            h3("Minimum price"),
            textOutput("minprice"),
            h3("Maximum Price"),
            textOutput("maxprice")
           
        )
    )
))
