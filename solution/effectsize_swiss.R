## -------------------------------------------------------------------------------------------------------------------------------------
## a
library("mmstat4")
bank2 <- ghload("data/bank2.rds")
str(bank2)
#
library("psych")
sapply(bank2, function(v) {
  c <- cohen.d(v, as.factor(1:length(v)>100))
  list("cohen.d"=c$cohen.d[,"effect"], "cohen.r"=c$r)
})
## b
sapply(bank2, function(v){
  t.test(v[101:200], v[1:100])[c("statistic", "p.value")]
})
sapply(bank2, function(v){
  kruskal.test(v[101:200], v[1:100])[c("statistic", "p.value")]
})

