from scipy.stats import binom
def sign_test(data, mu0=0.5):
    ntie = sum(1 for x in data if x == mu0)
    nlow = sum(1 for x in data if x < mu0)
    nupp = sum(1 for x in data if x > mu0)
    if (nlow<nupp):
        nlow = nlow+ntie
    # Calculate the p-value using the binomial distribution
    p_value = binom.cdf(min(nlow, len(data)-nlow), len(data))
    return p_value
Boston = ghload("Boston200.rds")
p_value = sign_test(Boston['medv'])
print("p-value:", p_value)
