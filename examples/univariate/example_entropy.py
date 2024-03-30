import pandas as pd, scipy.stats as ss
boston_df = ghload("Boston", "MASS")
#
ftab = boston_df['rad'].value_counts()
# Calculating entropy
ent  = ss.entropy(ftab)
# Calculating normalized entropy
normalized_ent = ent / len(ftab)
#
print("Entropy:", ent)
print("Normalized Entropy:", normalized_ent)
