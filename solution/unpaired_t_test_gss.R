## ------------------------------------------------------------------------------------------------------------------------------
library("mmstat4")
gss <- ghload("data/gss.rds")
t.test(age~richwork, data=gss)
t.test(educ~richwork, data=gss)
t.test(tvhours~richwork, data=gss)

