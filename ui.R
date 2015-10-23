library(shiny)

# Main function
shinyUI(fluidPage(
    
    titlePanel("Interactive Dataset Explorer"),

    sidebarLayout(
        sidebarPanel(
            p("You already checked mtcars, swiss, ... datasets in Coursera's Data Science Specialization.
            Ever wondered to have a quick look
              at other R base datasets? Well, here is the complete list:"),
            
            selectInput("dataset", "Choose a dataset:", 
                        choices = data()$results[,3],multiple=FALSE,selectize=TRUE),
            
            p("Dataset description:"),
            htmlOutput("dsDescription")
        ),
        
        mainPanel(
            tabsetPanel(type="tabs",
                        tabPanel("Table viewer",
                        h3("Table view"),
                        dataTableOutput("view")
                        ),
                        tabPanel("Dataset Help Page",
                        htmlOutput("dsHelp",inline=TRUE)
                        )
                        )
        )
    )
))