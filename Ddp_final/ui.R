library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Days to New Year 2017"),
  sidebarPanel(
    dateInput("date","Date:"),
    radioButtons("choice", "Do you like to party?",
                 c("Yes" = "Yes",
                   "No" = "No"))
    ),
  mainPanel(
   h3('New Year 2017 Calculation'),
 h4('Selected Day'),
   verbatimTextOutput("odate"),
 h4('What is the time difference to the new year 2017:'),
 verbatimTextOutput("odate2"),
 h4('Party Feedback'),
 verbatimTextOutput("ochoice")
  )
))

