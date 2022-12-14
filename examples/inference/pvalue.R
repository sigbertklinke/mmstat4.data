library("MASS")

pdf("pvalue.pdf", width=12, height=8, bg="transparent")
c  <- 13.898
v  <- (0:200)/200*qchisq(0.999, df=8)
dv <- dchisq(v, df=8)
plot(v, dv, type="l", ylab="Density")
abline(v=13.898)
text(4.5, 0.95*max(dv), expression(V %~~% chi[8]^2), pos=2)

text(qchisq(0.95, df=8), 0.5*max(dv), expression(paste('v=', chi['8;0.95']^2, '=15.507')), pos=4, col="red")
text(c, 0.95*max(dv), sprintf('v=%.3f', c) , pos=2)
x <- c+(0:100)/100*(max(v)-c)
dx <- dchisq(x, df=8)
dx <- c(0, dx, 0)
x  <- c(x[1], x, x[100])
polygon(x, dx, col="grey")
text(c, max(dx)/2, 'p=0.08447', col="darkgrey", pos=2)

c <- qchisq(0.95, df=8)
x <- c+(0:100)/100*(max(v)-c)
dx <- dchisq(x, df=8)
dx <- c(0, dx, 0)
x  <- c(x[1], x, x[100])
polygon(x, dx, border="red", density=10, col="red")
text(20, max(dx)/2, expression(paste(alpha, "=0.05")), col="red", pos=4)
abline(v=qchisq(0.95, df=8), col="red")

t <- capture.output(chisq.test(Boston$chas, Boston$rad))
t <- gsub("\t", "", t) # take tab out
legend("topright", legend=t)
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/pvalue.pdf"))

