#day3----
(x= c(1,2,3,4))
(x2= c(1,2,,3,,4))
(x2= c(1,2,NA,3,NA,4))
sum(x)
sum(x2)
sum(x2, na.rm=T)
length(x2)
is.na(x2)
sum(is.na(x2))
sum(is.na(x2))/length(x2)  # pect. of missing values

x2[is.na(x2)]
x2[is.na(x2)]= mean(x2,na.rm=T)
x2
library(vim)
library(VIM)

data(sleep)
sleep

head(sleep)
tail(sleep)
dim(sleep)
nrow(sleep)
length(sleep)
summary(sleep)
str(sleep)

(x= 200:300)
quantile(x)
quantile(x, seq(0,1,.1))
is.na(sleep)
sum(is.na(sleep))

colSums(is.na(sleep))
rowSums(is.na(sleep))
complete.cases(sleep)
sum(complete.cases(sleep))
sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]
xy= colSums(is.na(sleep))
xy
xy[xy>0]
(c1=names(xy[xy>0]))
sleep[,c1]
sleep%>%select(c1)
sleep%>%select(-c1)
sleep%>%select(c1)%>% length()


#Data partitioning
(x= 1:100)
s1= sample(x,size=70)
s1

sum(s1)
set.seed(134) #use this for repeat
sum(s1)

s2= sample(x,size=.7*length(x))
length(s2)
x

mtcars
mtcars%>% sample_n(24)
dim(mtcars)
dim(mtcars);nrow(mtcars)

(index=sample(1:nrow(mtcars),size=.7*nrow(mtcars)))
1:nrow(mtcars)
nrow(mtcars)
mtcars[index, ]
dim(mtcars[index,])
mtcars[-index,]

pinstall= c('rpart.plot', 'caTools', 'arules', 'arulesViz', 'factoextra','dendextend','nbClust','cluster', 'fpc', 'amap','animation')
install.packages(pinstall)
summary(sleep)
#data partition
library(caTools)

sample=sample.split(Y=mtcars$am, SplitRatio = .7)
sample
table(sample)
prop.table(table(sample))
mtcars[sample==T,]
mtcars[sample==F,]

y1=mtcars[sample==T,]
y2=mtcars[sample==F,]
prop.table(table(y1$am))
prop.table(table(y2$am))
table(y1$am);prop.table(table(y1$am))
table(y2$am);prop.table(table(y2$am))
library(caret)

(intrain= createDataPartition(y = mtcars$am, p=.7, list=F))
train=mtcars[intrain,]
test=mtcars[-intrain,]
prop.table(table(train$am));prop.table(table(test$am))
