library("HH")
data(ProfChal)
main <- 'Is your job professionally challenging?'
# Stacked barchart
tab1 <- as.matrix(ProfChal[ProfChal$Subtable=="Employment sector", 1:5])
rownames(tab1) <- ProfChal$Question[2:6]
barplot(t(tab1), horiz=TRUE, main=main)
barplot(t(tab1/rowSums(tab1)), horiz=TRUE, main=main)
# Likert plot
tab  <- ProfChal[ProfChal$Subtable=="Employment sector",]
likert(Question ~ . , tab, main=main, ylab=NULL)
likert(Question ~ . , tab, as.percent=TRUE, main=main, ylab=NULL)
# small multiples
library("lattice")
df1 <- as.data.frame(as.table(tab1))
barchart(Freq~Var1|Var2, df1)
