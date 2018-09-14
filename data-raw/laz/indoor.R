library(magrittr)
library(rlas)
library(data.table)
library(jsonlite)

#' Prepare data

# Fit point cloud in a 1x1x1 box centered at [0, 0, 0]
normalize_data <- function(data) {
  values_max <- apply(data, 2, max)
  values_min <- apply(data, 2, min)
  values_mid <- (values_max + values_min) / 2
  
  scale <- max(values_max - values_min)
  
  (sweep(data, 2, values_mid) / scale) %>%
    as.data.table()
}

data <- "data-raw/laz/indoor.0.1.laz" %>%
  rlas::read.las("xyz") %>%
  normalize_data()

saveRDS(data, "data/rds/indoor-scan.rds")
