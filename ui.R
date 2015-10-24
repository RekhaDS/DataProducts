##This is a simple web application mainly for Kid-centives, i.e: to inspire their best behavior. But everyone
## in the family participates. Each family member starts with $1 in their account. 
##Any time someone gets a ticket 0.35 cents is deducted from their account and
##each reward is rewarded by increasing 0.65 cents in their account. 
library(shiny)

shinyUI(fluidPage(
  ##Choose name from the dropdown
  title = 'Kid-centives',
  sidebarLayout(
    sidebarPanel(
      selectInput(
        'chooseName', 'Family Member names', choices = c("Jack",
                                                         "Thomas","Dad",
                                                         "Mom"),
        selectize = FALSE
      ),
      ## Action button for a ticket or a reward
      fluidRow(
      column(3,div(style="display:inline-block",actionButton("ticket", "Ticket"), style="float:right")),
      column(6,div(style="display:inline-block",actionButton("reward", "Reward"), style="float:right")))
    ),
    mainPanel(
      helpText('The table below shows the total dollar amount for each family member'),
      column(6,
             tableOutput('table')
      )
      )
      )
))