# install all R packages neccessary for Datenanalyse I+II 4 Apr 2024
install(rlibs=c("rJava",
        "agricolae", "alphahull", "Amelia", "andrews", "ape", "aplpack", "ash", "boot", "car",  "cluster", "coin", "crayon", "dbscan",
        "deldir", "DescTools", "devtools", "e1071", "effectsize", "effsize", "entropy", "flexclust", "foreign", "fpc", "gam",
        "GGally", "ggmap", "ggplot2", "glmnet", "gplots", "hexbin", "Hmisc", "igraph", "lattice", "lawstat", "lmtest", "locfit",
        "magrittr", "MASS", "mclust", "mctest", "mgcv", "mice", "mitools", "mlbench", "mlmi", "moments", "NbClust", "neuralnet",
        "nnet", "nortest", "np", "olsrr", "outliers", "parameters", "paran",  "plot.matrix", "plotrix", "proxy", "pscl", "psych",
        "QuantPsyc", "randomForest", "RColorBrewer", "reshape2", "rio", "robustbase", "rpart", "rpart.plot", "sampling", "scagnostics",
        "scatterplot3d", "shiny", "shinydashboard", "shinyWidgets", "sm", "smvgraph", "spdep", "stringr",
        "TeachingDemos", "tibble", "Transform", "UsingR", "vcd", "vcdExtra", "VIM", "vioplot", "whoami", "xlsx", "xtable"
        ))
## or: sudo apt-get install r-cran-rjava
# sudo apt install  default-jre default-jdk cmake libgsl-dev libudunits2-dev libgdal-dev
# sudo R CMD javareconf
