library(htmltab)
url <- 'http://swcarpentry.github.io/r-novice-gapminder/'
swc.tab <- htmltab(doc = url)

min.sess <- c(1,2,3,4,5,6,8,10,11,16)
rwksp <- cbind(swc.tab[min.sess,1:2],
               time = diff(strptime(swc.tab[,1], 
                   format = "%H:%M"))[min.sess])
colnames(rwksp) <- c('Elapsed','Topic','Unit Time')
write.csv(rwksp[,c(2,3,1)],file = '../data/wksp_outline.csv',row.names = F)

as.numeric(sum(diff(strptime(swc.tab[,1], 
                             format = "%H:%M"))[min.sess])) / 60
url <- 'http://swcarpentry.github.io/r-novice-gapminder/reference/'
ref.tab <- htmltab(doc = url)
ref.tab[,1]
