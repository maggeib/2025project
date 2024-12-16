#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

#all teams to check page for
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

ui <- fluidPage(
  
  titlePanel("PRG Sales and Data"),
  sidebarLayout(
    sidebarPanel(
      "Menu",
    selectizeInput("team", "Select Team to view", teams, selected = NULL, multiple = FALSE)
    ),
    mainPanel(
      "Sales by team"
      )
    )
  )

server <- function(input, output){
}

shinyApp(ui = ui, server = server)

