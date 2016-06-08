
x <- read.csv('../data/REU_Survey.csv')
head(x)
colnames(x)
plot(I.have.used.R~Programming.Experience,data=x)
plot(x)

nam <- substr(x$Name,1,3)
katies <- grepl('kat',x$Name,ign=TRUE)
katies <- grepl('kat',x$Name,ign=TRUE)

nin <- agrepl('ninja',x$Pirates.or.Ninjas,ign=TRUE)
pir <- agrepl('pirate',x$Pirates.or.Ninjas,ign=TRUE)
bot <- agrepl('both',x$Pirates.or.Ninjas,ign=TRUE)
pOn <- nin*3 + pir*2 + bot
pOn[pOn == 3] <- 'ninja'
pOn[pOn == '2'] <- 'pirate'
pOn <- factor(pOn)


x$Pirates.or.Ninjas <- pOn

table(pOn)
chisq.test(table(pOn))

plot(Programming.Experience~Zombocalypse,data=x)
abline(lm(Programming.Experience~Zombocalypse,data=x))
summary(lm(Programming.Experience~Zombocalypse,data=x))

plot(Programming.Experience~factor(pOn),data=na.omit(x))
summary(aov(Programming.Experience~factor(pOn),data=na.omit(x)))
