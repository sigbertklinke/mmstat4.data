# install R libraries and python modules if necessary
install(rlibs=c("reticulate", "feather"),
        pymods=c("pandas", "numpy", "statsmodels", "scipy", "matplotlib", "seaborn", "stemgraphic", "autoimpute",
          "scikit-learn", "outliers")
)
#install(c("pandas", "numpy", "scikit-learn", "rpy2", "pyreadstat", "matplotlib", "seaborn",
#             "plotnine", "scipy", "bootstrapped", "feather-format", "pingouin", "statsmodels",
#             "stemgraphic", "pyod", "effectsize"), "py")
