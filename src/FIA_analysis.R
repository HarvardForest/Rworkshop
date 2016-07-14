library(plyr)
library(ggplot2)

##this is for the instructors so that we have proof of concept when we're asking them to do things
#setwd("D:/Rworkshop/Rworkshop/data/")
#setwd('../data')
MAtrees <- read.csv("CleanedMATrees.csv")
WAtrees <- read.csv("CleanedWATrees.csv")

WAsqmi <- 71362 #area of washington
MAsqmi <- 10565 #area of Massachusetts

MApercFor <- .62 #percent forested MA
WApercFor <- .52 #percent forested WA

##We need to teach them some form of aggregation, ddply is the one I know best, but I'm open to other ideas
ddply(MAtrees,.(INVYR),summarise,TotalCarbon = sum(CARBON_AG,na.rm=T),CarbPerSqMi = TotalCarbon / MAsqmi, CarbPerSqMiFor = TotalCarbon/(MAsqmi * MApercFor))
ddply(WAtrees,.(INVYR),summarise,TotalCarbon = sum(CARBON_AG,na.rm=T),CarbPerSqMi = TotalCarbon / WAsqmi, CarbPerSqMiFor = TotalCarbon/(WAsqmi * WApercFor))

### plot values
dat <- rbind(MAtrees,WAtrees)
dat$state <- c(rep('MA',nrow(MAtrees)),rep('WA',nrow(WAtrees)))

pdf('../results/totCperYr.pdf')

ggplot(dat, aes(x=CN, y=PLT_CN, color=state)) + 
    geom_point(shape=1) + 
        scale_colour_hue(l=50) + 
            geom_smooth(method=lm, se=TRUE) 

dev.off()

our.plot <- ggplot(dat, aes(x=CN, y=DIA, color=state)) 

our.plot +  geom_point(shape=1) + 
    scale_colour_hue(l=50) + 
    geom_smooth(method=lm, se=TRUE) 


### Statistics

## t-test
dia.WA14 <- WAtrees[WAtrees[,'INVYR'] == 2014,'DIA']
dia.MA14 <- MAtrees[MAtrees[,'INVYR'] == 2014,'DIA']
t.test(dia.WA14,dia.MA14)

## ANOVA
fit <- aov(DIA~state,data=dat)
summary(fit)

## How do you save output
capture.output(summary(fit))
dia.anova <- capture.output(summary(fit))
write.csv(dia.anova)

## assumptions?
## Are our sample sizes equal?
ggplot(dat, aes(x=DIA,color=state)) + 
    geom_histogram()
