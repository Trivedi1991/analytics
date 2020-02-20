#datafraame
names= c("AP","NM","RJ","SK","TK","AA","AS")
(rollid= 1:7)
(rollid= paste("IIML", 1:7 ,sep = '-' ))
(age= round(runif(7,min=15,max=45),2))
(gender= sample(c('M','F'),7,replace= T))
P= data.frame(names,rollid,age,gender)
P
write.csv(P,'data/background.csv',row.names = F)
read.csv('data/background.csv')
