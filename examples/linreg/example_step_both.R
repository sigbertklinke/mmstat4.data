library("mmstat4")
cps78_85 <- ghload("cps.rds")
xs  <- subset(cps78_85, year==85)
library("olsrr")
# Largest model
llm <- lm (lwage~educ+poly(exper,2), data=xs)
res <- ols_step_both_p(llm, progress=TRUE)
res$model