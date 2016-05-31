### Builds the course notes and presentation.
## 
## It can be run from the command line using
## 
## Rscript build.R notes.Rmd
## 

library(rmarkdown)
## Build notes html
render(tail(commandArgs(trailingOnly=TRUE)),output_format='html_document')
## Build notes pdf
render(tail(commandArgs(trailingOnly=TRUE)),output_format='pdf_document')
## Build presentation html
x <- tail(commandArgs(trailingOnly=TRUE))
render(x,output_format='ioslides_presentation',output_file=paste(sub('.Rmd','',x,ignore.case=TRUE),'_talk.html',sep=''))

