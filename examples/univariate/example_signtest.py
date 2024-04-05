from scipy.stats import binom
def sign_test(data, mu0=None):
    p0 = mu0
    if p0 is None:
        p0 = data.mean()
    ntie = sum(1 for x in data if x == p0)
    nlow = sum(1 for x in data if x < p0)
    nupp = sum(1 for x in data if x > p0)
    if (nlow<nupp): nlow = nlow+ntie
    # Calculate the p-value using the binomial distribution
    p_value = 2*binom.cdf(min(nlow, len(data)-nlow), n=len(data), p=0.5)
    return p_value
Boston = r["mmstat4::ghload"]("Boston200.rds")
p_value = sign_test(Boston['medv'])
print("p-value:", p_value)
