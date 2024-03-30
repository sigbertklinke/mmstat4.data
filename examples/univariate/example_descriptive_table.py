import pandas as pd, numpy as np
boston_df = ghload("Boston", "MASS")
# Frequency table / Percentage distribution
frequency = pd.crosstab(index=boston_df['rad'], columns='count')
print(frequency)
percentage = 100*pd.crosstab(index=boston_df['rad'], 
                             columns='percentage', normalize=True)
print(percentage)
# Cumulative frequency table / percentage distribution
cumulative_frequency = frequency.cumsum()
print(cumulative_frequency)
cumulative_percentage = percentage.cumsum()
print(cumulative_percentage)
