setwd("c:\\r_temp")

install.packages("wordcloud")
install.packages("openNLP")

library("wordcloud")
library("openNLP")

data1 <- readLines("test01.txt")
data1
data2 = strsplit(data1," ")
data2 <- gsub("'","", data2)
data2 <- gsub("\\d+","", data2)
data2 <- gsub(" ","", data2)
data2 <- gsub("\\.","", data2)
data2
data2 <- sapply(data1, extractNoun, USE.NAMES=F)
data3 <- unlist(data2)
data3 <- Filter(function(x) {nchar(x)>=2}, data3)
write(unlist(data3), "steve_2.txt")
data4 <- read.table("steve_2.txt")
wordcount <- table(data4)
library(RColorBrewer)
palete <- brewer.pal(9,"Set1")
wordcloud(names(wordcount),
freq=wordcount,
scale=c(5,0.5),
rot.per=0.25,
min.freq=1,
random.order=F,
random.color=T, 
colors=palete)

legend(0.3,1 ,"Steve Jobs 스탠포드 연설문 분석",cex=0.8,fill=NA,border=NA,bg="white" ,
   text.col="red",text.font=2,box.col="red")

savePlot("test.png", type="png")