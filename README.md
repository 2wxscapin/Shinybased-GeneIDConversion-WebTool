# Shinybased-GeneIDConversion-WebTool
A gene ID conversion web tool based on Shiny
This tool allow you to update a gene list with gene in *.txt/*.csv foramt, and the symbols will be converted to ENTREZID, ENSEMBL, UNIGENE, UNIPROT, and GENENAME.
Of course you can edit the code to change the annotation package or input/output gene ID type, and don't forget use `AnnotationDbi::colums` to check.
And when you upload a file, it will be look like:
