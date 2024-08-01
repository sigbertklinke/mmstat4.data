import numpy as np, pandas as pd
from sklearn.preprocessing import StandardScaler
from gtda.plotting import plot_scatterplot
from gtda.pipeline import make_pipeline
from gtda.scagnostics import Scagnostics
iris = r["iris"]
#
scaler = StandardScaler()
df_scaled = scaler.fit_transform(iris)
scag = Scagnostics()
scagnostics_scores = scag.fit_transform(df_scaled)
scagnostics_df = pd.DataFrame(scagnostics_scores, columns=scag.scagnostic_names_)
plot_scatterplot(df_scaled[:, 0], df_scaled[:, 1], scagnostics_df)
print(scagnostics_df)
