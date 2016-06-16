### Analysis of data from the Rworkshop
### 17June2016

## Question: Is there a relationship between preparation for
## a zombie apocalypse and programming experience?

## load any packages you might need in the script

## data from R workshop intro 
REUdata <- read.csv('../data/REUdata.csv')

## take a look at the data and maybe run some tests
summary(REUdata)
str(REUdata)
class(REUdata)
mode(REUdata)
table(REUdata[,'Programming.Experience'])
is.numeric(REUdata[,'Programming.Experience'])
name.1 <- substr(REUdata[,1],1,3)
table(name.1)

## Deal with issues in the data

## Visualize patterns

## Stats

## Add statistical results

## Export results

## Make and save final figures

