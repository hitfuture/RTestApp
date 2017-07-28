library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  output$dateselected <- renderText({paste("start date:",input$daterange1[1])})


  observe({

    updateTextInput(session,inputId = "myresults",value = input$sdrangepicker)
  })
  observeEvent(input$sdrangepicker,
               {
                 output$selecteddate <- renderText({

                   input$sdrangepicker

                 })
               }
  )

  output$selecteddate <- renderText({

    input$sdrangepicker

  })
  output$enddateselected <- renderText({
    input$enddate
  })



})
