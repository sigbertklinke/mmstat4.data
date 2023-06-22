## ------------------------------------------------------------------------------------------------------------------------------
## a
tab <- matrix(NA, ncol=2, nrow=2, 
              dimnames=list(c("pro Brexit before speech", "contra Brexit before speech"),
                            c("pro Brexit after speech", "contra Brexit after speech")))
tab[1,1] <- 130-45
tab[1,2] <- 45
tab[2,1] <- 24
tab[2,2] <- 120-24
mcnemar.test(tab)
## b
# significant, but
margin.table(tab, 1)
margin.table(tab, 2)

