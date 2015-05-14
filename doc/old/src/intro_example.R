###Why coding is like magic.

###install.packages(c("devtools", "rjson", "bit64", "httr"));library(devtools);install_github("geoffjentry/twitteR")
source("http://biostat.jhsph.edu/~jleek/code/twitterMap.R")
library(twitteR)

api_key <- "8upvChU3cbjdMjVxTQjKWQ"
api_secret <- "0yHrpjPjcRxqtW2kjGYePD91D9TTrbJrlSwiW4zo"
access_token <- "532543695-Z0eVHohnT3rkyP0XdcnxjaINqAK18bJoXpsNlX3z"
access_token_secret <- "S821o9UmaNEb1BKPhT6CUUi53vdPYfMlj3iKN86B4WrDb"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

searchTwitteR('@HarvardForest',n=10,since='2014-01-01',until='2015-03-11')
find.ecosystem <- searchTwitteR('#ecosystem',n=100,since='2014-01-01',until='2015-03-11')
tweeters <- lapply(find.ecosystem,function(x) x$getScreenName())
user.info <- lapply(tweeters,getUser)
loc.tweets <- lapply(user.info,location)


twitterMap("HarvardForest",'Boston, MA',fileName="HF_twittermap.pdf", nMax=100,plotType='followers')
