library(shiny)
library(markdown)

shinyUI(navbarPage("Car Consumption App",
                   tabPanel("Predictor",
                            sidebarLayout(
                              sidebarPanel(
                                h3('Input car´s especifications:'),
                                numericInput('wt', 'Weight (in 1000 lbs)', 0.6, min=0.6, max=12, step=0.1),
                                sliderInput('hp', 'Horsepower', 60,  min=60, max=600, step=10),
                                radioButtons('cyl', 'Number of Cylinders', c('4' = '4', '6' = '6', '8' = '8')),
                                radioButtons('am', 'Transmission Type', c('Automatic' = '0', 'Manual' = '1')),
                                submitButton('Submit')
                              ),
                              
                              mainPanel(
                                h4('Description'),
                                p('This Shiny application predicts the Car Consumption (in MPG) based on the following parameters:'),
                                tags$ul(
                                  tags$li('Weight of the car (in 1000 lbs)'),
                                  tags$li('Horsepower of the car'),
                                  tags$li('Number of cylinders in the car (4, 6 or 8)'),
                                  tags$li('Transmission type of the car (Manual or Automatic)')
                                ),
                                
                                h4('Procedure'),
                                tags$ul(
                                  tags$li('Input the car specifications.'),
                                  tags$li('Click the Submit Button.'),
                                  tags$li('The predicted Car Consumption (in MPG) value will be printed in the following textbox.')
                                ),
                                
                                h4('Car Consumption (MPG)'),
                                verbatimTextOutput('mpg')
                              )
                            )),
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("README.md")
                            ))
))

        