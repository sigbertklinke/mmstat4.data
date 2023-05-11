## -----------------------------------------------------------------------------------------------------------------------
library("mmstat4")
salary   <- ghload("data/salary.rds")
sex      <- names(attr(salary$sex, "labels"))[salary$sex+1]
sexrace  <- names(attr(salary$sexrace, "labels"))[salary$sexrace]
minority <- names(attr(salary$minority, "labels"))[salary$minority+1]
jobcat   <- names(attr(salary$jobcat, "labels"))[salary$jobcat]
### a
tapply(salary$salbeg, sex, mean, na.rm=TRUE)
tapply(salary$salbeg, sexrace, mean, na.rm=TRUE)
tapply(salary$salbeg, jobcat, mean, na.rm=TRUE)
### b
# check 
tapply(salary$salbeg, sex, length)
tapply(salary$salbeg, sex, shapiro.test)
tapply(salary$salbeg, sex, var, na.rm=TRUE)
tapply(salary$salbeg, sex, Skew, na.rm=TRUE)
sexanova <- aov(salary$salbeg~sex)
summary(sexanova)
kruskal.test(salary$salbeg, sex)
#
tapply(salary$salbeg, sexrace, length)
tapply(salary$salbeg, sexrace, shapiro.test)
tapply(salary$salbeg, sexrace, var, na.rm=TRUE)
tapply(salary$salbeg, sexrace, Skew, na.rm=TRUE)
sexraceanova <- aov(salary$salbeg~sexrace)
summary(sexraceanova)
kruskal.test(salary$salbeg, sexrace)
### c ???
### d
tapply(salary$salbeg, jobcat, length)
tapply(salary$salbeg, jobcat, shapiro.test)
tapply(salary$salbeg, jobcat, var, na.rm=TRUE)
tapply(salary$salbeg, jobcat, Skew, na.rm=TRUE)
jobcatanova <- aov(salary$salbeg~jobcat)
summary(jobcatanova)
kruskal.test(salary$salbeg, jobcat)
### 
table(jobcat)
tapply(salary$salbeg[jobcat=='CLERICAL'], sexrace[jobcat=='CLERICAL'], mean, na.rm=TRUE)
kruskal.test(salary$salbeg[jobcat=='CLERICAL'], sexrace[jobcat=='CLERICAL'])
sexraceanova <- aov(salary$salbeg~sexrace, subset=(jobcat=='CLERICAL'))

