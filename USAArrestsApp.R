#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#Note: Edgar and I couldn't get the x column name to show up. Neither of us are quite sure
#why it wasn't working.
library(datasets)
library(shiny)
library(dplyr)
library(thematic)
head(USArrests)

USArrests <- select(USArrests, -UrbanPop)
#USArrests <- USArrests[1:5,]

# Define UI for application that draws a histogram
ui <- fluidPage(    
  theme = bslib::bs_theme(bootswatch = "sandstone"),
  # Give the page a title
  titlePanel("US Arrests"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("crime", "Crime:", 
                  choices=colnames(USArrests)),
      hr(),
      helpText("Data from R Studio")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("arrestsPlot")  
    )
    
  )
)

# Define server logic required to draw a histogram
server <- # Define a server for the Shiny app
  function(input, output) {
    thematic::thematic_shiny()
    
    # Fill in the spot we created for a plot
    output$arrestsPlot <- renderPlot({
      
      # Render a barplot
      barplot(USArrests[,input$crime], 
              main=input$crime,
              ylab="Times Ocurred (per 10,0000)",
              xlab="State")
    })
  }

# Run the application 
shinyApp(ui = ui, server = server)
