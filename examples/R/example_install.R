if(interactive()) {
  # install from an official CRAN server
  install.packages("mmstat4")
  # install from a specific CRAN server
  install.packages("mmstat4", repos="https://ftp.gwdg.de/pub/misc/cran/")
  # install from GitHub
  library("devtools")
  install_github("sigbertklinke/mmstat4")
}
