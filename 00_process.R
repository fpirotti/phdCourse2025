library(terra)
greeting <- "Hello class!"
print(greeting)
myRange <- 2:50
print(myRange)
myRange <- c(2,4, "pippo")
print(myRange)
myRange * 2

myRange <- list(234, 0.55, "pippo")

countries <- c(rep("Italy", 4000),
               rep("Germany", 2000),
               rep("China", 1000),
               rep("India", 1000))
table(countries)
countries.factors <- as.factor(countries)
levels(countries.factors)
as.integer(countries.factors)

library(rgee)

library(rgee)
HOME <- Sys.getenv("HOME")
Sys.setenv("RETICULATE_PYTHON" = sprintf("C:/Users/AlbertoAdmin/AppData/Local/r-miniconda"))
ee_install() 
Y

