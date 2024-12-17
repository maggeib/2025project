#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(bslib)
library(htmltools)
library(shinydashboard)

#Teams to create dynamic page for
teams <- c("UK - Panoramic Care",
           "UK - Panoramic Housing",
           "UK - Panoramic Public Sector",
           "UK - Finitas",
           "UK - iO IT Perm",
           "UK - iO IT Contract",
           "UK - iO Engineering Perm",
           "UK - iO Engineering Contract",
           "UK - Consulting",
           "UK - Customer Success",
           "UK - iO IT Manchester",
           "EU - iO Engineering",
           "EU - iO IT",
           "US - iO IT Tampa",
           "US - iO IT Philadelphia",
           "ID - 360",
           "ID - Delivery",
           "ID - Data"
)

#Define UI for application
ui <- dashboardPage(skin = "purple",
  dashboardHeader(title = "PRG Analytics"),
  dashboardSidebar(
    sidebarMenu( #create tabs in sidebar
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Team Of The Month", tabName = "team_of_the_month", icon = icon("trophy")),
      selectInput("team", "Select Team:", choices = teams),
      dateRangeInput("dateRange", "Select Date Range", #create daterange entry
                     start = NULL,
                     end = NULL,
                     min = NULL,
                     max = NULL,
                     format = "yyyy-mm-dd",
                     startview = "month",
                     weekstart = 0,
                     language = "en",
                     separator = " to ",
                     width = NULL,
                     autoclose = TRUE
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(title = "Team Data", background = "purple", solidHeader = TRUE, #box1
                    plotOutput("teamPlot")),
                infoBox("Target", 10 * 2, icon = icon("handshake"))
              )
      ),
      tabItem(tabName = "Team Of The Month",
              box(width = 10, background = "purple")
              )
    )
  )
)
# Define server logic. you can set invalidation/validations here
#can set how the code executes to respond to any input updates
server <- function(input, output){
  output$teamPlot <- renderPlot({
    # Placeholder for plot logic
    plot(1:10, main = paste("Data for", input$teams))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
