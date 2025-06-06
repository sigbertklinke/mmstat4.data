# install all necessary Python modules
#
# install.packages("reticulate")
library("reticulate")
py_discover_config()   # which python version used ?
# all example programs are tested with python 3.10.12
# py_install("3.10.12")
# use_python("3.10")

venv <- mmstat4::py_env()
if(!py_module_available("autoimpute")) py_install("autoimpute", venv)
if(!py_module_available("factor_analyzer")) py_install("factor_analyzer", venv)
if(!py_module_available("giotto-tda")) py_install("giotto-tda", venv)
if(!py_module_available("matplotlib")) py_install("matplotlib", venv)
if(!py_module_available("numpy")) py_install("numpy", venv)
if(!py_module_available("outlier-utils")) py_install("outlier-utils", venv)
if(!py_module_available("pandas")) py_install("pandas", venv)
if(!py_module_available("pyclustering")) py_install("pyclustering", venv)
if(!py_module_available("scipy")) py_install("scipy", venv)
if(!py_module_available("seaborn")) py_install("seaborn", venv)
if(!py_module_available("scikit-fuzzy")) py_install("scikit-fuzzy", venv)
if(!py_module_available("scikit-learn")) py_install("scikit-learn", venv)
if(!py_module_available("scikit-learn-extra")) py_install("scikit-learn-extra", venv)
if(!py_module_available("statsmodels")) py_install("statsmodels", venv)
if(!py_module_available("stemgraphic")) py_install("stemgraphic", venv)
if(!py_module_available("yellowbrick")) py_install("yellowbrick", venv)

# All modules:
# "pandas", "numpy", "scikit-learn", "rpy2", "pyreadstat", "matplotlib", "seaborn",
# "plotnine", "scipy", "bootstrapped", "feather-format", "pingouin", "statsmodels",
# "stemgraphic", "pyod", "effectsize")
