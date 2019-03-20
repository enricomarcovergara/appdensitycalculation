#BARANGAY DENSITY
  pop <- read.csv("population.csv")
  regarea <- read.csv("regionarea.csv")
  library(dplyr)
  colnames(pop)
  numBarangay <- aggregate(pop$Barangay,list(Region=pop$Region),function(x) length(x))
  numBarangay
  BarangayArea <- merge(numBarangay,regarea)
  BarangayArea <- mutate(BarangayArea,AveArea=Area/x)
  BarangayArea
  merged <- merge(pop,BarangayArea)
  densitycomputed <- mutate(merged, BarangayDens=Population/AveArea)
  top5popdens <- densitycomputed[order(-densitycomputed$BarangayDens),]
  top5popdens
  head(top5popdens,5)
