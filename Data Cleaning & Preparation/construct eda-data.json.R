
# construct eda-data.json
setwd('D:/Coursework/info viz/YFCC-USA-Town-Recommendation/Data Cleaning & Preparation')

library(tidyverse)
library(data.table)
library(geojsonio)
library(jsonlite)

yfcc_usa <- fread(file = 'yfcc_usa.csv', showProgress=T)
sample <- sample_n(yfcc_usa, 100000) %>%
          arrange(date_taken)

sample$date <- paste(sample$month, sample$year, sep = ' ')

sample <- sample[sample$town!="",]
sample <- sample[c(2,4,5,7,11)]

geojson_write(sample, lat = "latitude", lon = "longitude", file = "../Github_Page/data/eda-data.geojson")

# sample <- sp::SpatialPointsDataFrame(coords = sample[,c("longitude", "latitude")],
#                                    data = sample[,c(-3, -4)], 
#                                    proj4string = sp::CRS("+init=epsg:4326"))
# mapview::mapview(sample, zcol='state', pal='Set1')