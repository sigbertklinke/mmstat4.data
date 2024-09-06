library("olsrr")
data("Boston", package="MASS")
bhd  <- Boston[,-c(4,9)]
vars <- names(bhd)[-12]
lmf  <- lm(medv~., data=Boston)
lmi  <- lm(medv~1, data=bhd)
crit <- list(R2=summary(lmi)$r.squared,
             R2adj=summary(lmi)$adj.r.squared,
             `Mallows' Cp`=ols_mallows_cp(lmi, lmf),
             PRESS=ols_press(lmi),
             AIC=AIC(lmi), BIC=BIC(lmi)
             )
p    <- 0:length(vars)
model <- "1"
for (i in seq(vars)) {
  res   <- add1(lmi, as.formula(paste0("medv~", paste0(vars, collapse="+"))))
  model <- c(model, row.names(res)[which.min(res$RSS)])
  lmi <- lm(as.formula(paste0("medv~", paste0(model, collapse="+"))), data=Boston)
  crit$R2    <- c(crit$R2, summary(lmi)$r.squared)
  crit$R2adj <- c(crit$R2adj, summary(lmi)$adj.r.squared)
  crit$AIC   <- c(crit$AIC, AIC(lmi))
  crit$BIC   <- c(crit$BIC, BIC(lmi))
  crit$PRESS <- c(crit$PRESS, ols_press(lmi))
  crit$`Mallows' Cp` <- c(crit$`Mallows' Cp`, ols_mallows_cp(lmi, lmf))
}
pdf("model_criteria.pdf", width=10)
par(mfrow=c(2,3))
for (cname in names(crit)) {
  if (startsWith(cname, "Mallow")) {
    plot(p, crit[[cname]], type="p", axes=FALSE, main=cname, xlab="", ylab="", ylim=c(0,100))
    lines(1+range(p), range(p), col="blue")
    v<-which.min(abs(crit[[cname]]-p-1))
    print(v)
    abline(v=v)
  }
  else {
    plot(crit[[cname]], type="b", axes=FALSE, main=cname, xlab="", ylab="")
    abline(v=if (startsWith(cname, "R2")) which.max(crit[[cname]]) else which.min(crit[[cname]]))
  }
  axis(1, at=1:12, labels=model, las=2)
  axis(2)
  box()
}
dev.off()
if (interactive()) browseURL(paste0(getwd(),"/model_criteria.pdf"))

