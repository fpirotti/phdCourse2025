library(terra)
##  read the NDVI raster downloaded from GEE ----
ls9NDVI = terra::rast("data/NDVIpercentiles.tif")
##  read the Thermal raster downloaded from GEE ----
ls9thermal = terra::rast("data/ThermalPercentiles.tif")

## uncomment this to get summary ----
# summary(ls9thermal)
# 
# hist(ls9thermal$ST_B10_p50)
# hist(ls9thermal$ST_B10_p100, col="#ff000066", add=T)

## sample 3k points as points using the following function 
## we will use these to sample the two rasters....
sm <- terra::spatSample(ls9thermal, 3000, as.points=T, 
                        na.rm=T, values=F )

## the "extract" function from terra samples the values at samples points
thermSample <-  terra::extract(ls9thermal$ST_B10_p50, sm) 
NDVI.Sample <-  terra::extract(ls9NDVI$NDVI_p100, sm) 

## plot to see how it looks   
plot( NDVI.Sample$NDVI_p100, 
      thermSample$ST_B10_p50 )

## seems like correlation is present only below NDVI 

## apply a simple linear model to check goodness of fit
ff = lm(  thermSample$ST_B10_p50 ~ 
          NDVI.Sample$NDVI_p100
         ) 

plot( NDVI.Sample$NDVI_p100, 
      thermSample$ST_B10_p50 )

smoothScatter( NDVI.Sample$NDVI_p100, 
      thermSample$ST_B10_p50 )
summary(ff)

## we see from the plots that there is a negative correlation 
## but it is not evident from the r-squared due to data not being 
## distributed normally.