# install R libraries if necessary
install(c("reticulate", "feather"), "R")

# install Python modules if necessary
install(c("pandas", "numpy", "scikit-learn", "rpy2", "pyreadstat", "matplotlib", "seaborn",
             "plotnine", "scipy", "bootstrapped", "feather-format", "pingouin", "statsmodels",
             "stemgraphic", "pyod", "effectsize"), "py")
