## ------------------------------------------------------------------------------------------------------------------------
gss   <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
deduc <- na.omit(gss$husbeduc - gss$wifeduc)
plot(density(deduc, adjust=1.25), type="l")
rug(deduc)
abline(v=median(deduc), col="red")
wilcox.test(gss$husbeduc, gss$wifeduc, paired = TRUE)
t.test(gss$husbeduc, gss$wifeduc, paired=TRUE)

