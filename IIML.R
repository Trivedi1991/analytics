#DAY1
?mtcars # HELP ON DATASET

x=1
class(x)
x
y=c(1,2,4)
summary(mtcars)

#vectos----
x=1:100
x
x1= c(1,5,6)
x1
print(x1)
?rnorm
(x4= rnorm(n=100, mean=50, sd=10))
plot(x4)
plot(density(x4))

hist(x4)
hist(x4, breaks=15, col=1:10)
range(x4)
min(x4)
mean(x4)
plot(sort(x4), type=  "l")
sort(x4)
x4[x4>60]
x4[1:10]
?c(1:10)
length(x4)
length(x4[x4>60])
x4>60
#Matrices
(data = c(10,20,30,40,50,55))
(m1= matrix(data=data, nrow=2))
m1= matrix(data=data, nrow=2)
colnames(m1)= c('c1','c2','c3')
m1
m1[1,]
m1[,1]
rowSums(m1)
colMeans(m1)
apply(m1,1,FUN=min)
# Dataframe----

(rollnumber=1:13)
(rollnumber= paste('IIML', 1:13, sep='-'))
(age=round(runif(13,min=24,max=32),2))
?runif  
(gender= sample(c('m','f'), size=13, replace=T))
table(gender)
(gender= sample(c('m','f'), size=13, replace=T, prob=c(.7,.3)))
(grade= sample(c('Ex','Good','Bad'), size=13, replace=T, prob=c(.6,.3,.1)))
table(gender)
table(grade)

(students= data.frame(rollnumber,age,gender,grade))
?data.frame
write.csv(students,'data/students.csv', row.names=F)
df1=read.csv('data/students.csv')
df1
DF2=read.csv()
df2=read.csv(file.choose())
library(dplyr)
students
students %>% group_by(gender) %>% summarise(mean(age))
