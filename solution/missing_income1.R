## ----------------------------------------------------------------------------------------------------------------
## a
library("mmstat4")
allbus <- ghload("data/allbus2018.rds")
ptvar <- startsWith(names(allbus), "pt")
trust <- allbus[names(allbus)[ptvar]]
colnames(trust) <- c("Gesundheitswesen", "Bundesverfassungsgericht", "Bundestag", 
                     "Stadt/Gemeindeverwaltung","Justiz", "Fernsehen", "Zeitungswesen", 
                     "Hochschulen/Universitäten", "Bundesregierung", "Polizei", 
                     "Politische Parteien", "Kommission der EU", "Europäisches Parlament")
# vars
colSums(is.na(trust))/nrow(trust)
# obs
prop.table(table(rowSums(is.na(trust))))
## b
library("plot.matrix")
trustna <- is.na(trust)
opar <- par(mar=c(8.1, 8.1, 4.1, 4.1))
on.exit(par(opar))
plot(as.cor(cor(trustna)), breaks=seq(-1, 1, 0.2), xlab="", ylab="", cex=0.5,
     axis.col=list(side=1, las=2, cex.axis=0.7), 
     axis.row = list(side=2, las=1, cex.axis=0.7))
devtools::unload('plot.matrix') # Package devtools must be installed!
#
library("mice")
pat <- md.pattern(trust, plot=FALSE)
colnames(pat) <- abbreviate(colnames(pat))
o   <- order(as.numeric(row.names(pat)), decreasing=TRUE)
head(pat[o,], 10)
## c
grp <- is.na(allbus$di05)
table(grp)
table(grp, allbus$land)
plot(table(grp, allbus$land))
library("DescTools")
CramerV(grp, allbus$land)
crv <- rep(NA, ncol(trust))
for (i in 1:ncol(trust)) {
  crv[i] <- CramerV(grp, trust[,i])
}
names(crv) <- names(trust)
crv
## d
# MAR or MNAR


