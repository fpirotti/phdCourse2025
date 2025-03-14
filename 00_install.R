library(reticulate)

library(rgee)


HOME <- Sys.getenv("HOME")
Sys.setenv("RETICULATE_PYTHON" = sprintf("C:/Users/AlbertoAdmin/AppData/Local/r-miniconda"))
ee_install() 
 
library(remotes)
install_github("r-spatial/rgee", force = T)
