library(shiny); library(shinythemes)
library(tidyr); library(dplyr)
library(DT); library(lingStuff)

features <- distFeat[[1]]
distFeatDefs <- distFeat[[2]]

shinyUI(
  fluidPage(theme = shinytheme("united"),
    fluidRow(
      column(3,
        h1('Spanish allophones'),
        wellPanel(
        # Drop down of all features
        selectInput(inputId = 'in0', label = 'Features', 
                    choices = colnames(features[6:length(features)]), 
                    multiple = TRUE, selectize = TRUE), 

        # Radio buttons for features
        uiOutput("ui"),

        # Details
        p(strong("Created by:"), 
        tags$a("Joseph V. Casillas", href="http://www.jvcasillas.com"),
        br(), strong("Source code:"), 
        tags$a("Github", href="https://github.com/jvcasill/shiny_bivariate_regression/")),
        
        # Include download bottom
        downloadButton('downloadData', 'Download')
      )), 
      column(3, 
        h2(''),
        br(), 
        h4('Output'), 
        br(),
        htmlOutput("symbols")
      ),
      column(5,
        h2(''),
        br(),
        h4('Definitions'), 
        dataTableOutput('defs'),
        br()
      )
    )
  )
)




