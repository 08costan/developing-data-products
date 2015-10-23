library(shiny)

# Main function
shinyUI(fluidPage(
    
    titlePanel("Interactive Dataset Explorer"),

    sidebarLayout(
        sidebarPanel(
            h4("1) Quick-start guide:"),
            
            p("You already checked mtcars, swiss, ... datasets in Coursera's Data Science Specialization.
            Ever wondered to have a quick look
              at other R base datasets? Well, here is the complete list."),
            
            p("Pick one dataset in the list below. A short description will immediately
              appear below the name you selected. This app has two tabs: Table Viewer and Dataset Help page.
              Whenever you select a new dataset, the tabs will automatically update, so you can either check
              the contents of the dataset or its help page (taken from R documentation)."),
            
            
            h4("2) Pick a dataset:"),
            
            selectInput("dataset","Dataset:", 
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