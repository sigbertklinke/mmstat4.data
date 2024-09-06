library("mmstat4")
cps78_85 <- ghload("cps.rds")
xs  <- subset(cps78_85, year==85)
library("olsrr")
# Largest model
llm <- lm (lwage~educ+exper+expersq+married, data=xs)
res <- ols_step_forward_p(llm, progress=TRUE)
res$model
