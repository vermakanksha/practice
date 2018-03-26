dfFlag<-read.csv('/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/flag.data.txt',header=FALSE)
str(dfFlag)
nameCountry <- 'name'
namesGeography <- c('continent', 'zone', 'area')
namesDemography <- c('population', 'language', 'religion')
namesAttributes <- c(nameCountry, namesGeography, namesDemography)
namesNumbers <- c('bars', 'stripes', 'colors')
namesColors <- c('red', 'green', 'blue', 'gold', 'white', 'black','orange')
nameMainColor <- 'mainhue'
namesDrawings <- c(
  'circles', 'crosses', 'saltires', 'quarters',
  'sunstars', 'crescent', 'triangle', 'icon', 'animate', 'text')
namesAngles <- c('topleft', 'botright')
namesFlag <- c(namesNumbers, namesColors, nameMainColor, namesDrawings,
               namesAngles)
names(dfFlag) <- c(namesAttributes, namesFlag)
dfFlag

library(data.table)
dtFlag <- data.table(dfFlag)
dtFlag[1:20, continent]
vectorContinents <- c('N.America', 'S.America', 'Europe', 'Africa','Asia', 'Oceania')
dtFlag[, continent := factor(continent, labels=vectorContinents)]
vectorZones <- c('NE', 'SE', 'SW', 'NW')
dtFlag[, zone := factor(zone, labels=vectorZones)]
vectorLanguages <- c(
  'English', 'Spanish', 'French', 'German', 'Slavic',
  'Other Indo-European', 'Chinese', 'Arabic',
  'Japanese/Turkish/Finnish/Magyar', 'Others')
dtFlag[, language := factor(language, labels=vectorLanguages)]
vectorReligions <- c(
  'Catholic', 'Other Christian', 'Muslim', 'Buddhist',
  'Hindu', 'Ethnic', 'Marxist', 'Others'
)
dtFlag[, religion := factor(religion, labels=vectorReligions)]
str(dtFlag)
