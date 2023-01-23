library("mmstat4")
body <- ghload("data/allbus2012.rds")
body <- body[,c("age", "height", "weight")]
# number of NAs
nabody <- is.na(body)
apply(nabody, 2, sum)
# full data
mean(body$weight)
cor(body)
# case deletion
mean(body$weight, na.rm=T)
cor(body, use="complete.obs")
sum(complete.cases(body))
# available case analysis
cor(body, use="pairwise.complete.obs")
crossprod(!nabody)
