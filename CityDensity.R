#CITY DENSITY
  pop <- read.csv("population.csv")
  regarea <- read.csv("regionarea.csv")
  library(dplyr)
  colnames(pop)
  numCity <- aggregate(pop$CityProvince,list(Region=pop$Region),function(x) length(unique(x)))
  colnames(numCity)[2] <- c('TotalNumCity')
  numCity
  regarea
  CityArea <- merge(numCity,regarea)
  CityArea
  AveCityArea <- mutate(numCity,AveArea=CityArea$Area/TotalNumCity)
  AveCityArea
  popagg <- aggregate(pop$Population,list(Region=pop$Region,CityProvince=pop$CityProvince),FUN=sum)
  colnames(popagg)[3] <- c('TotalPopulation')
  colnames(popagg)
  citymerge <- merge(popagg,AveCityArea)
  colnames(citymerge)
  citydens <- mutate(citymerge,Density=TotalPopulation/AveArea)
  top5citydens <- citydens[order(-citydens$Density),]
  head(top5citydens,5)