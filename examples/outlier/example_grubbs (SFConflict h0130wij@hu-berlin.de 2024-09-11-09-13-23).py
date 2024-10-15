import pandas as pd, numpy as np
from outliers import smirnov_grubbs as grubbs
samp = r["mmstat4::ghload"]("Boston200.rds")
# returns the non-outliers
grubbs.test(samp['crim'])
grubbs.two_sided_test(samp['crim'])
grubbs.min_test(samp['crim'])
grubbs.max_test(samp['crim'])
# get outlier indices, also for min_test and max_test
grubbs.two_sided_test_indices(samp['crim'])
# get outliers, also for min_test and max_test
grubbs.two_sided_test_outliers(samp['crim'])
