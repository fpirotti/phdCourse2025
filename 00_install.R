
# the lines below will install RGEE
library(remotes)
# install from my version
install_github("fpirotti/rgee", force = T)

# install from original developer version
# (only to be done once)
# install_github("r-spatial/rgee")
HOME <- Sys.getenv("HOME")

# 1. Install miniconda
# reticulate::install_miniconda()
Sys.setenv("RETICULATE_PYTHON" = sprintf("C:/Users/AlbertoAdmin/AppData/Local/r-miniconda", HOME))

# load library
library(rgee)
# ee_install() 
ee_Initialize() 

db <- 'OpenLandMap/CLM/CLM_LST_MOD11A2-DAYNIGHT_M/v01'
image <- ee$Image(db)
image$bandNames()$getInfo()


