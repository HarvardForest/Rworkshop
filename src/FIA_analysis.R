library(plyr)
library(ggplot2)
##this is for the instructors so that we have proof of concept when we're asking them to do things
setwd("D:/Rworkshop/Rworkshop/data/")
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
pdf('../results/totCperYr.pdf')
# Same, but with different colors and add regression lines
dat <- rbind(MAtrees,WAtrees)
dat$state <- c(rep('MA',nrow(MAtrees)),rep('WA',nrow(WAtrees)))
ggplot(dat, aes(x=INVYR, y=DIA, color=state)) + geom_point(shape=1) + scale_colour_hue(l=50) + # Use a slightly darker palette than normal
    geom_smooth(method=lm,   # Add linear regression lines
                se=TRUE)    # Don't add shaded confidence region
dev.off()
