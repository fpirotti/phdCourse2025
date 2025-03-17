library(terra)

ls9NDVI = terra::rast("data/NDVIpercentiles.tif")
ls9thermal = terra::rast("data/ThermalPercentiles.tif")

# summary(ls9thermal)
# 
# hist(ls9thermal$ST_B10_p50)
# hist(ls9thermal$ST_B10_p100, col="#ff000066", add=T)
plot(ls9NDVI$NDVI_p50)
sm <- terra::spatSample(ls9thermal, 3000, as.points=T, 
                        na.rm=T, values=F )


thermSample <-  terra::extract(ls9thermal$ST_B10_p100, sm) 
NDVI.Sample <-  terra::extract(ls9NDVI$NDVI_p100, sm) 

plot( NDVI.Sample$NDVI_p100, 
      thermSample$ST_B10_p100 )
fndvi <- NDVI.Sample$NDVI_p100 < 0.3
ff = lm(  thermSample$ST_B10_p100[fndvi] ~ 
          NDVI.Sample$NDVI_p100[fndvi]
         )

plot( NDVI.Sample$NDVI_p100[fndvi], 
      thermSample$ST_B10_p100[fndvi] )

summary(ff)
