library("shiny")
shinyServer(
  function(input,output,session){
    ##initial csv file with four columns Name, Ticket,Reward and Total $ amount
    values <- reactiveValues(df_data = read.csv("readTable.csv", sep = ","))
    
    ## If a reward the family member is rewarded with 0.65 cents. 
    observeEvent(input$reward, {
      name <- input$chooseName
      n <- values$df_data$Reward[values$df_data$Names == name]
      t <- values$df_data$Total.in.dollar[values$df_data$Names == name]
      values$df_data$Reward[values$df_data$Names == name] <- as.integer(n + 1)
      values$df_data$Total.in.dollar[values$df_data$Names == name] <- t + 0.65
    })
    
    ## If a ticket then the family member's account is deducted with 0.35 cents
    observeEvent(input$ticket, {
      nameTicket <- input$chooseName
      nt <- values$df_data$Ticket[values$df_data$Names == nameTicket]
      tot <- values$df_data$Total.in.dollar[values$df_data$Names == nameTicket]
      values$df_data$Ticket[values$df_data$Names == nameTicket] <- as.integer(nt + 1)
      values$df_data$Total.in.dollar[values$df_data$Names == nameTicket] <- tot - 0.35
    })
    
    ## Print the dataframe.
    output$table <- renderTable({
      print(values$df_data)
    }, 'include.rownames' = FALSE
    , 'include.colnames' = TRUE
    , 'sanitize.text.function' = function(x){x}
    )
    
})