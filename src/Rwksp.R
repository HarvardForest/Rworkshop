### Analysis of data from the Rworkshop
### 17June2016

## Question: Is there a relationship between preparation for
## a zombie apocalypse and programming experience?

## load any packages you might need in the script

## data from R workshop intro 
reu <- read.csv('../data/REUdata.csv')

## take a look at the data and maybe run some tests
summary(reu)
str(reu)
class(reu)
mode(reu)
table(reu[,'Programming.Experience'])
is.numeric(reu[,'Programming.Experience'])
name.1 <- substr(reu[,1],1,3)
table(name.1)

## Deal with issues in the data
colnames(reu) <- c('name','R','prog','stats','zombie','pn')
reu[,'prog'] <- round(reu[,'prog'] ,1)
reu[reu[,'zombie'] < 1,'zombie'] <- 0

## Visualize patterns
hist(reu[,'prog'])
hist(reu[,'zombie'])

plot(zombie~prog,data=reu)

## Stats
zp.fit <- lm(zombie~prog,data=reu)
summary(zp.fit)

## Add statistical results
plot(zombie~prog,data=reu,xlab='Programming Experience',ylab='Zombie Preparedness')
abline(zp.fit)

## Export results
out <- as.matrix(anova(zp.fit))
write.csv(out,file="../results/prog_zombie_reg.csv")

## Make and save final figures

pdf('../results/prog_zombie_reg.pdf')
plot(zombie~prog,data=reu,xlab='Programming Experience',ylab='Zombie Preparedness')
abline(zp.fit)
dev.off()
