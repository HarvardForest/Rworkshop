### Builds the course notes and presentation.
## 
## It can be run from the command line using
## 
## Rscript build.R notes.Rmd
## 

packs <- c('rmarkdown','knitr')
sapply(packs[!packs %in% installed.packages()[,1]],install.packages)
sapply(packs,require,quietly=TRUE,character.only=TRUE)

## Build notes html
x <- tail(commandArgs(trailingOnly=TRUE))
render(x,output_format='html_document')
## Build notes pdf
x <- tail(commandArgs(trailingOnly=TRUE))
render(x,output_format='pdf_document')
## Build presentation html
x <- tail(commandArgs(trailingOnly=TRUE))
render(x,output_format='ioslides_presentation',output_file=paste(sub('.Rmd','',x,ignore.case=TRUE),'_talk.html',sep=''))
## separate code 
#purl(input=x,output=paste(sub('.Rmd','',x,ignore.case=TRUE),'_rcode.R',sep=''))
