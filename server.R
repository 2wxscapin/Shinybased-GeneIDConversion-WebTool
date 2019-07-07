suppressPackageStartupMessages(library(org.Hs.eg.db))
suppressPackageStartupMessages(library(org.Mm.eg.db))
suppressPackageStartupMessages(library(AnnotationDbi))


server <- function(input, output) {
  
  output$genelist <- renderTable({
    
    if (is.null(input$file1))
      return(NULL)
    
    urgene <- read.csv(input$file1$datapath, 
                       header = FALSE, sep = "\t")
    colnames(urgene) <- "SYMBOL"
    urgene
     
  })
  
  annodb <- reactive({
    
    if(input$reference == "hs"){
      require(org.Hs.eg.db)
      annodb <- org.Hs.eg.db
    } else {
      (input$reference == "mm")
      require(org.Mm.eg.db)
      annodb <- org.Mm.eg.db
    } 
  
  })
  
  
  mykey <- reactive({
    
    req(input$file1)
    
    ks <- as.character(read.csv(input$file1$datapath, 
                                header = FALSE, sep = "\t")[,1])
    return(ks)
  })
  
  

  output$annotationinfo <- renderTable({
       
    input$goButton
    
    AnnotationDbi::select(
      annodb(),
      keys = mykey(),
      column = c("ENTREZID", "ENSEMBL", 
        "UNIGENE", "UNIPROT", "GENENAME"),
      keytype = "SYMBOL")
    
  })
  
}
