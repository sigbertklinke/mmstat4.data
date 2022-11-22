## ------------------------------------------------------------------------------------------------------------------------
# a +b
library("rio")
country <- import("https://shinyapps.wiwi.hu-berlin.de/d/COUNTRY.SAV")
lm1 <- lm(LIFEEXPM~URBAN+LNDOCS+LNBEDS+LNGDP+LNRADIO, data=country, x=TRUE)
summary(lm1)
## c
ind <- as.integer(row.names(lm1$x))
opar <- par(mfrow=c(2,3))
on.exit(par(opar))
plot(rstudent(lm1)~predict(lm1))
plot(rstudent(lm1)~country$URBAN[ind])
plot(rstudent(lm1)~country$LNDOCS[ind])
plot(rstudent(lm1)~country$LNBEDS[ind])
plot(rstudent(lm1)~country$LNGDP[ind])
plot(rstudent(lm1)~country$LNRADIO[ind])

