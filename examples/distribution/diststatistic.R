pdf("diststatistic.pdf", width=10, height = 7)
x <- seq(-2.5, 2.5, by=0.001)
f1 <- pnorm(x)
f2 <- pt(x-0.25, 2)
par(mfrow=c(2,2))
plot(x, f1, type="l", ylab="", main="Cumulative distribution functions", col="red")
lines(x, f2)
legend("topleft", c(expression(F[0](x)),expression(F[n](x))), col=c("red", "black"), lwd=2)
#
dn <- abs(f1-f2)
plot(x, dn, type="l", ylab="", main="Kolmogorov-Smirnov")
dnx <- which(max(dn)==dn)
for (i in 1:length(dnx)) {
  lines(c(x[dnx[i]], x[dnx[i]]), c(0, dn[dnx[i]]), col="red")
}
text(x[1], 0.1, expression(paste(D[n], "=", sup[x](paste("|", F[n](x)-F[0](x), "|")))), col="red", pos=4)

#
cvm <- (f1-f2)^2
plot(x, cvm, type="l",  main="Cramer-von Mises", ylab="")
polygon(c(min(x), x, max(x)), c(0, cvm, 0), col="red")
text(x[1], 0.01,  expression(paste("T=", integral((F[n](x)-F[0](x))^2, -infinity, infinity), " dx")), col="red", pos=4)

ad <- (f1-f2)^2/(f1*(1-f1))
plot(x, ad, type="l", main="Anderson-Darling", ylab="")
polygon(c(min(x), x, max(x)), c(0, ad, 0), col="red")
text(x[1], 0.675,  expression(paste(A^2, "=", integral(paste(" ", frac((F[n](x)-F[0](x))^2, F[0](x)(1-F[0](x)))), -infinity, infinity), " dx")), col="red", pos=4)
dev.off()