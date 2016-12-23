library(shiny)
shinyServer(
  function(input, output) {
    output$odate = renderPrint({input$date})
    output$odate2 = renderPrint({as.Date("2017-01-01")-as.Date(input$date)})
    output$ochoice = renderPrint(if (input$choice == "Yes" ) {"Rock On!"} else {"Boring!"})
  }
)