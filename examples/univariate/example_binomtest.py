from statsmodels.stats.proportion import binom_test
from statsmodels.stats.proportion import proportions_ztest
Boston = ghload("Boston200.rds")
res = binom_test(sum(Boston['chas']), len(Boston['chas']))
print(res)
#
res = proportions_ztest(sum(Boston['chas']), len(Boston['chas']), 
                        value=0.5)
print(res)
