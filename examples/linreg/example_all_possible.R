library("mmstat4")
cps78_85 <- ghload("cps.rds")
xs  <- subset(cps78_85, year==85)
library("olsrr")
# Largest model: all vars must be explicitly written
llm <- lm (lwage~educ+exper+I(exper^2), data=xs)
res <- ols_step_all_possible(llm, progress=TRUE)
res