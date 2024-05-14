## ---------------------------------------------------------------------------------------------------------------------------------
err <- function (v) { sum(v)-max(v) }
library("mmstat4")
gss <- ghload("data/gss.rds")
#a
tab    <- table(gss$hapmar, gss$happy, deparse.level=2)
thappy <- margin.table(tab, 2) # happy dependent
thappy
ehappy <- err(thappy)
ehappy
#b
e2 <- apply(tab, 1, err)
e2
(ehappy-sum(e2))/ehappy
#c
thapmar <- margin.table(tab,1)
thapmar
ehapmar <- err(thapmar)
ehapmar
e2<-apply(tab, 2, err)
e2
(ehapmar-sum(e2))/ehapmar
#d
# cols = happy dependent
# rows = hapmar dependent
nom.lambda(tab)
#e
ord.gamma(tab)
#f
ord.tau(tab)

