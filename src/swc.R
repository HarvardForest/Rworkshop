library(htmltab)
url <- 'http://swcarpentry.github.io/r-novice-gapminder/'
swc.tab <- htmltab(doc = url)

min.sess <- c(1,2,3,4,5,6,8,10,11,16)
notes <- as.character(rep('',length(min.sess)))
notes[7] <- 'I think that this can be reduced to 30 min'
notes[8] <- 'We should replace this with the old function creation exercise. Should take 15 minutes. Then, we should re-iterate what packages are.'
notes[9] <- 'This can just focus on Writing out plots. We also might want to move this up to go with creating pub quality graphics.'
rwksp <- cbind(swc.tab[min.sess,1:2],
               time = diff(strptime(swc.tab[,1], 
                   format = "%H:%M"))[min.sess],
               notes = notes)

colnames(rwksp) <- c('Elapsed','Topic','Unit Time')
write.csv(rwksp[,c(2,3,1,4)],file = '../data/wksp_outline.csv',row.names = F)

as.numeric(sum(diff(strptime(swc.tab[,1], 
                             format = "%H:%M"))[min.sess])) / 60
url <- 'http://swcarpentry.github.io/r-novice-gapminder/reference/'
ref.tab <- htmltab(doc = url)
ref.tab[,1]
