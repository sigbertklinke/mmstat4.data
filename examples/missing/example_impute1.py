import pandas as pd, numpy as np
body = r["mmstat4::ghload"]("allbus2012.rds")
body = body[["age", "height", "weight"]]
# Number of NAs
nabody = body.isna()
nabody_sum = nabody.sum(axis=0)
print(nabody_sum)
# Default: case deletion
print(body["weight"].mean())
print(body.corr())
