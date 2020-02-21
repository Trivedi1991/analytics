#day2----
mtcars
table(mtcars$cyl)
library(dplyr)
mtcars%>% group_by(cyl)
mtcars%>% group_by(cyl)%>% tally()
ftable(mtcars$cyl)
xtabs(~cyl,data=mtcars)
mtcars %>% select(cyl,mpg)
table(mtcars$cyl,mtcars$gear)
mtcars%>% group_by(cyl,gear)%>% tally()
ftable(mtcars$cyl,mtcars$gear)
mtcars%>% group_by(cyl,gear)%>% summarise(count=n())
table(mtcars$cyl,mtcars$gear, dnn = c('cyl','gear'))
df=mtcars
head(df)
tail(df)
#as.data.frame() when you need all data
df$am= ifelse(df$am==0, 'Auto','Manual')
df
df$mpg
mtcars%>%mutate(TxType= ifelse(am==0,'Auto','Manual'))
df
#increase Mileage by 10%
df$mpg*1.1

#add mpg+wt into new column MPGWT
df$mpg + df$wt
df$MPGWT= df$mpg +df$wt
head(df)
# find top 2 cars from mileage point of view of each gear 
df%>% group_by(gear)%>% arrange(-mpg)%>% select(gear,mpg)
df%>% group_by(gear)%>% top_n(n=2, wt=mpg)
df%>% group_by(gear)%>% top_n(n=2, wt=mpg)%>% select (gear,mpg)
df%>% group_by(gear)%>% top_n(n=2, wt=-mpg)%>% select (gear,mpg)
# list out details of any 2 cars picked randomly: then do 25% of the cars
df%>% sample_n(2)
df%>% sample_frac(.25)
df%>% top_n(2)
# sort on mpg
df%>% sample_frac(.25)%>% arrange(desc(mpg))
df%>% sample_frac(.25)%>% arrange(mpg)
df[order(df$mpg),]
df%>% select(gear,mpg,wt,hp)%>% summarise_all(mean)
df%>% select(gear,mpg,wt,hp)%>% group_by(gear) %>% summarise_all(mean)
df%>% group_by(gear)%>% summarise_at(c('mpg','wt','hp','disp'),c(mean))
#Graphs
hist(df$mpg)
barplot(table(df$gear),col=1:3)
pie(table(df$gear))
pie(table(df$gear), labels=c('G1','G2','G3'))
plot(df$wt,df$mpg)
table(df$gear)
library(ggplot2)
library(reshape2)

(rollno= paste('IIML',1:10, sep= '-'))
(name= paste('Sname',1:10, sep=''))
(gender= sample(c('M','F'), size = 10, replace=T))
(Program= sample(c('BBA','MBA'), size=10,replace=T))
(marketing= trunc(rnorm(10, mean=60,sd=10)))
(finance= trunc(rnorm(10,mean=50,sd=12)))
(operations= trunc(rnorm(10, mean=70,sd=10)))
ST= data.frame(rollno,name,gender,Program,marketing,finance,operations,stringsAsFactors=F)
ST
head(ST)
(meltsum1= melt(ST, id.vars=c('rollno','name','gender','Program'),variable.name='subject',value.name='marks'))
meltsum1
meltsum1%>% group_by(Program, gender,subject)%>% summarise(MeanMarks= mean(marks))

ST%>% group_by(gender)%>% summarise(count=n())
ggplot(ST%>% group_by(gender)%>% summarise(count=n()),aes(x=gender,y=count,fill=gender))+geom_bar(stat='identity')+geom_text(aes(label=count))
#Stack bar
ggplot(ST%>% group_by(Program,gender)%>% summarise(count=n()),aes(x=gender,y=count,fill=Program))+geom_bar(stat='identity')+geom_text(aes(label=count))+labs(title='Genderwise-Programwise')
#side by side bar
ggplot(ST%>% group_by(Program,gender)%>% summarise(count=n()),aes(x=gender,y=count,fill=Program))+geom_bar(stat='identity',position=position_dodge2(.7))+geom_text(aes(label=count),position=position_dodge2(.7))+labs(title='Genderwise-Programwise')
names(meltsum1)
names(ST)
ggplot(meltsum1%>% group_by(Program,gender,subject)%>% summarise(meanMarks=round(mean(marks))),aes(x=gender,y=meanMarks,fill=Program))+geom_bar(stat='identity',position=position_dodge2(.7))+geom_text(aes(label=meanMarks), position=position_dodge2(.7))+labs(title='subject-Program-gender-meanMarks') + facet_grid(~subject)


       
       
       
       
       
       