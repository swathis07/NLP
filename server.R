library(shiny)
source("predict.R")

shinyServer(
  function(input,output,session){
    #     userText <- reactive({input$userText})
    #     writtenText <- as.character(substitute(userText))
    #    output$topSelection <- userText
    #     if(substr(userText,length(userText)-1, length(userText)) == " "){
    #     
    #predictedWords <- c("","","","","","")
    predictedWords <- reactive({predict(input$textIn)})
    output$text1 <- renderText({ input$textIn  })
    output$nextword <- renderText({ as.character(predictedWords()[1])})
    
    output$firstWord <- renderUI({
      actionButton("action1",class="btn btn-success",label=predictedWords()[1])
    })
    output$secondWord <- renderUI({
      if(is.na(predictedWords()[2])) label2=""
      else label2 = predictedWords()[2]
      actionButton("action2", class="btn btn-info",label=label2)
    })
    output$thirdWord <- renderUI({
      if(is.na(predictedWords()[3])) label3=""
      else label3 = predictedWords()[3]
      actionButton("action3", class="btn btn-info",label=label3)
    })
    
    output$fourthWord <- renderUI({
      if(is.na(predictedWords()[4])) label4=""
      else label4 = predictedWords()[4]
      actionButton("action4", class="btn btn-info",label=label4)
    })
    output$fifthWord <- renderUI({
      if(is.na(predictedWords()[5])) label5=""
      else label5 = predictedWords()[5]
      actionButton("action5", class="btn btn-info",label=label5)
    })
    output$sixthWord <- renderUI({
      if(is.na(predictedWords()[6])) label6=""
      else label6 = predictedWords()[6]
      actionButton("action6", class="btn btn-info",label=label6)
    })
    
    #my_clicks <- reactiveValues(data = NULL)
    
    observeEvent(input$action1, {
      isolate({
      my_clicks <- paste(input$textIn,predictedWords()[1])
      updateTextInput(session, inputId="textIn", value = my_clicks)
      session$sendInputMessage(inputId="textIn", my_clicks)
      session$sendCustomMessage("cursorEnd", TRUE)
      })
    })
    observeEvent(input$action2, {
      isolate({
        if(is.na(predictedWords()[2])) add <- c("") 
        else add <- predictedWords()[2]
        my_clicks <- paste(input$textIn,add)
        updateTextInput(session, inputId="textIn", value = my_clicks)
        session$sendInputMessage(inputId="textIn", my_clicks)
        session$sendCustomMessage("cursorEnd", TRUE)
      })
    })
    observeEvent(input$action3, {
      isolate({
        if(is.na(predictedWords()[3])) add <- c("") 
        else add <- predictedWords()[3]
        my_clicks <- paste(input$textIn,add)
        updateTextInput(session, inputId="textIn", value = my_clicks)
        session$sendInputMessage(inputId="textIn", my_clicks)
        session$sendCustomMessage("cursorEnd", TRUE)
      })
    })
    observeEvent(input$action4, {
      isolate({
        if(is.na(predictedWords()[4])) add <- c("") 
        else add <- predictedWords()[4]
        my_clicks <- paste(input$textIn,add)
        updateTextInput(session, inputId="textIn", value = my_clicks)
        session$sendInputMessage(inputId="textIn", my_clicks)
        session$sendCustomMessage("cursorEnd", TRUE)
      })
    })
    observeEvent(input$action5, {
      isolate({
        if(is.na(predictedWords()[5])) add <- c("") 
        else add <- predictedWords()[5]
        my_clicks <- paste(input$textIn,add)
        updateTextInput(session, inputId="textIn", value = my_clicks)
        session$sendInputMessage(inputId="textIn", my_clicks)
        session$sendCustomMessage("cursorEnd", TRUE)
      })
    })
    observeEvent(input$action6, {
      isolate({
        if(is.na(predictedWords()[6])) add <- c("") 
        else add <- predictedWords()[6]
        my_clicks <- paste(input$textIn,add)
        updateTextInput(session, inputId="textIn", value = my_clicks)
        session$sendInputMessage(inputId="textIn", my_clicks)
        session$sendCustomMessage("cursorEnd", TRUE)
      })
    })
    
    observeEvent(input$Clear, {
      isolate({
        updateTextInput(session,inputId="textIn",value="")
        session$sendInputMessage(inputId="textIn","")
        session$sendCustomMessage("cursorEnd", TRUE)
      })
    })
    
    
    
  }
)