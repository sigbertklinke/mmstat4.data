## ------------------------------------------------------------------------------------------------------------------------
err <- function (v) { sum(v)-max(v) }
library("rio")
gss <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
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
library("ryouready")
# cols = happy dependent
# rows = hapmar dependent
nom.lambda(tab)
#e
ord.gamma(tab)
#f
ord.tau(tab)

