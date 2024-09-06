import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
cps78_85 = r['mmstat4::ghload']("cps.rds")
cps = cps78_85[cps78_85['year'] == 85]
sns.lmplot(cps, x='educ', y='lwage', ci=None)
plt.xlabel('Education') 
plt.ylabel('Log Wage')
plt.show()
