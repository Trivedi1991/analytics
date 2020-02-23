#Linear regression----
women
head(women)
model= lm(weight~height,data =women)
summary(model)

#y = mx+c
weight= 3.45*height+ - 87.51
plot(x= women$height, y= women$weight)
abline(model, col=2)
residuals(model)
predict(model, newdata= women, type='response')
predwt= predict(model, newdata= women, type='response')
head(women)

cbind(women,predwt, res= women$weight- predwt, res2= residuals(model))

sqrt(sum(residuals(model)^2))
range(women$height)
ndata= data.frame(height=66.5)
(ndata= data.frame(height=c(66.5,75.8)))
predict(model, newdata= ndata, type='response')

#Confidence interval
confint(model)

#case-2

link = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=2023826519"

library(gsheet)
df=as.data.frame(gsheet2tbl(link))
head(df)
mdl= lm(Y~X,data =df)                 
summary(mdl)

Y= 1.6699*X + .9645
plot(df$X, df$Y)
abline(mdl, col=2)
range(df$X)
ndata2= data.frame(X=c(3,4))
predict(mdl, newdata =ndata2, type='response' )
plot(mdl)

link1= 'https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231'
df1=as.data.frame(gsheet2tbl(link1))

head(df1)

plot(df1$price,df1$sqty)
plot(df1$promotion,df1$sqty)
mdl2= lm(sqty~price+promotion,data =df1)  
summary(mdl2)
range(df1$price)                   
range(df1$promotion) 
plot(mdl2)
plot(df1$price,df1$sqty)
abline(mdl2)
(ndata3= data.frame(price=c(60,75), promotion=c(300,500)))
predict(mdl2, newdata= ndata3, type= 'response')
plot(mdl2)

library(rpart)
library(rpart.plot)
# Decision Tree - Classification
#we want predict for combination of input variables, is a person likely to survive or not

#import data from online site
path = 'https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/titanic_train.csv'
titanic <- read.csv(path)
head(titanic)
names(titanic)
data = titanic[,c(2,3,5,6,7)]  #select few columns only
head(data)
dim(data)
#load libraries
library(rpart)
library(rpart.plot)
str(data)
#Decision Tree
names(data)
table(data$Survived)
str(data)
data$Pclass = factor(data$Pclass)
fit <- rpart(Survived ~ ., data = data, method = 'class')
fit
rpart.plot(fit, extra = 104, cex=.8,nn=T)  #plot
head(data)
printcp(fit) #select complexity parameter
prunetree2 = prune(fit, cp=.018)
rpart.plot(prunetree2, cex=.8,nn=T, extra=104)
prunetree2
nrow(data)
table(data$Survived)
# predict for Female, pclass=3, siblings=2, what is the chance of survival

#Predict class category or probabilities
(testdata = sample_n(data,2))
predict(prunetree2, newdata=testdata, type='class')
predict(prunetree2, newdata=testdata, type='prob')
str(data)
testdata2 = data.frame(Pclass=factor(2), Sex=factor('male'), Age=15, SibSp=2)
testdata2
predict(prunetree2, newdata = testdata2, type='class')
predict(prunetree2, newdata = testdata2, type='prob')

#Use decision trees for predicting
#customer is likely to buy a product or not with probabilities
#customer is likely to default on payment or not with probabilities
#Student is likely to get selected, cricket team likely to win etc

#Imp steps
#select columns for prediction
#load libraries, create model y ~ x1 + x2 
#prune the tree with cp value
#plot the graph
#predict for new cases

#rpart, CART, classification model
#regression decision = predict numerical value eg sales

#Clustering
set.seed(123440)
(marks1= trunc(rnorm(n=30,mean= 70, sd= 8)))
sum(marks1)
df5= data.frame(marks1=marks1)
head(df5)
head(df5)

km3= kmeans(df5, centers=3)
attributes(km3)
km3$cluster
km3$centers
km3$size
sort(df5$marks1)
cbind(df5, km3$cluster)
df5$cluster= km3$cluster
head(df5)
df5%>% arrange(cluster)
dist(df5)
dist(df5[1:5,])

set.seed(12344)
(marks1= trunc(rnorm(n=30,mean= 70, sd= 8)))
(marks2= trunc(rnorm(n=30,mean= 120, sd= 10)))

df6= data.frame(marks1,marks2)
head(df6)

km3b= kmeans(df6, centers=3)
attributes(km3b)
km3b$cluster
km3b$centers
km3b$size
sort(df6$marks2)
cbind(df6, km3b$cluster)
df6$cluster= km3b$cluster
head(df6)
df6%>% arrange(cluster)
df6[1:5,]
dist(df6[1:5,])
plot(df6$marks1, df6$marks2, col=df6$cluster)

df6b= scale(df6)
head(df6b)
df6b= scale(df6[,c('marks1','marks2')])
head(df6b)


#wordcloud2
library(wordcloud2)
df= data.frame(word=c('iit','mdi','iim','imt'),freq= c(50,20,23,15))
df
par(mar=c(0,0,0,0))
wordcloud2(df)
