library(shiny)

data(mtcars)
attach(mtcars)

mtcars$cyl <- factor(cyl)
mtcars$am <- factor(am)

# wt (weight in 1000 lbs)
# hp (horsepower)
# cyl (number of cylinders)
# am (0 = auto, 1 = manual)

CarConsumptionModel <- lm(mpg ~ cyl + hp + wt + am, data = mtcars)

shinyServer(function(input, output) {
  output$mpg <- renderText({
    wt <- input$wt
    hp <- input$hp
    cyl <- input$cyl
    am <- input$am
    
    input_df <- data.frame(
      wt = wt, hp = hp, cyl = cyl, am = am
    )
    CarConsumptionPredict <- predict(CarConsumptionModel, input_df)
    CarConsumptionPredict
  })
})
