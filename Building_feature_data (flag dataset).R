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
