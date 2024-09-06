import pandas as pd
import statsmodels.api as sm
import statsmodels.formula.api as smf
import matplotlib.pyplot as plt
cps78_85 = r['mmstat4::ghload']("cps.rds")
cps = cps78_85[cps78_85['year'] == 85]
lm  = smf.ols('lwage ~ educ + exper', data=cps).fit()
fig = plt.figure(figsize=(12, 10))
fig = sm.graphics.plot_regress_exog(lm, 'educ', fig=fig)
for ax in fig.axes:
    ax.set_title(ax.get_title(), fontsize=10)
    ax.set_xlabel(ax.get_xlabel(), fontsize=8)
    ax.set_ylabel(ax.get_ylabel(), fontsize=8)
    for line in ax.get_lines():
        line.set_markersize(3)  
plt.subplots_adjust(top=0.8, hspace=0.75, wspace=0.75)
plt.show()
