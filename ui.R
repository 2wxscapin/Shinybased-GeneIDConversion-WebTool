library(shiny)

ui <- fluidPage(
  
  titlePanel("One Click Gene Annotation"),
  
  sidebarLayout(
    sidebarPanel(
      
      fileInput("file1", "Choose file to upload",
                multiple = FALSE,
                accept = c('text/csv',
                           'text/comma-separated-values',
                           'text/tab-separated-values',
                           'text/plain',
                           '.csv')),
      
      helpText(strong("Please upload a gene list.")),
      helpText("Accepted formats: .txt, .csv"),
      hr(),
      
      radioButtons("reference", "Select a reference genome:",
                   c("Human (Homo sapiens)" = "hs",
                     "Mouse (Mus Musculus)" = "mm"),
                   selected = 'hs'),
      hr(),
      
      actionButton("goButton", "GO!", icon("paper-plane"),
                   style="color: #fff; background-color: #337ab7; 
                   border-color: #2e6da4")
    ),
    
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("Your Genes", tableOutput("genelist")),
                  tabPanel("Converted IDs", tableOutput("annotationinfo"))
        
      )
    )
  )
)
