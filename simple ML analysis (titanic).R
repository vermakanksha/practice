help(Titanic)
class(Titanic)
Titanic
dfTitanic <- data.frame(Titanic)
str(dfTitanic)
library(data.table)
dtTitanic <- data.table(dfTitanic)
head(dtTitanic)
nTot <- dtTitanic[, sum(Freq)]
nTot
dtSurvived <- dtTitanic[, list(n=sum(Freq)), by='Survived']
dtSurvived
vectorHeight <- dtSurvived[, n]
vectorNames <- dtSurvived[, Survived]
barplot(height=vectorHeight, names.arg=vectorNames)
barplot(height=dtSurvived[, n], names.arg=dtSurvived[, Survived])
dtSurvived[, percentage := n / sum(n)]
dtSurvived[, colorPlot := ifelse(Survived == 'Yes', 'blue', 'red')]
barplot(
  height=dtSurvived[, percentage],
  names.arg=dtSurvived[, Survived],
  col=dtSurvived[, colorPlot],
  ylim=c(0, 1)
)
dtSurvived[, textPercentage := paste(round(percentage * 100), '%',
                                     sep='')]
plotTitle <- 'Proportion of passengers surviving or not'
ylabel <- 'percentage'
barplot(
  height=dtSurvived[, percentage],
  names.arg=dtSurvived[, Survived],
  col=dtSurvived[, colorPlot],
  ylim=c(0, 1),
  legend.text=dtSurvived[, textPercentage],
  ylab=ylabel,
  main=plotTitle
)
dtGender <- dtTitanic[, list(n=sum(Freq)), by=c('Survived', 'Sex')]
dtGender
dtGender[, percentage := n / sum(n), by='Sex']
dtGender[, colorPlot := ifelse(Survived == 'Yes', 'blue', 'red')]
dtGender[, textPercentage := paste(round(percentage * 100), '%',
                                   sep='')]
dtGenderMale <- dtGender[Sex == 'Male']
barplot(
  height=dtGenderMale[, percentage],
  names.arg=dtGenderMale[, Survived],
  col=dtGenderMale[, colorPlot],
  ylim=c(0, 1),
  legend.text=dtGenderMale[, textPercentage],
  ylab='percentage',
  main='Survival rate for the males'
)
barplot(
  height=dtGender[Sex == 'Female', percentage],
  names.arg=dtGender[Sex == 'Female', Survived],
  col=dtGender[Sex == 'Female', colorPlot],
  ylim=c(0, 1),
  legend.text=dtGender[Sex == 'Female', textPercentage],
  ylab='percentage',
  main='Survival rate for the females'
)
barplot(
  height=dtGender[Survived == 'Yes', percentage],
  names.arg=dtGender[Survived == 'Yes', Sex],
  col=dtGender[Survived == 'Yes', Sex],
  ylim=c(0, 1),
  legend.text=dtGender[Survived == 'Yes', textPercentage],
  ylab='percentage',
  main='Survival rate by gender'
)
dtClass <- dtTitanic[, list(n=sum(Freq)), by=c('Survived', 'Class')]
dtClass[, percentage := n / sum(n), by='Class']
dtClass[, textPercentage := paste(round(percentage * 100), '%',
                                  sep='')]
barplot(
  height=dtClass[Survived == 'Yes', percentage],
  names.arg=dtClass[Survived == 'Yes', Class],
  col=dtClass[Survived == 'Yes', Class],
  ylim=c(0, 1),
  legend.text=dtClass[Survived == 'Yes', textPercentage],
  ylab='survival rate',
  main='Survival rate by class'
)
dtGenderFreq <- dtTitanic[, list(n=sum(Freq)), by=c('Sex', 'Class')]
dtGenderFreq[, percentage := n / sum(n), by='Class']
dtGenderFreq <- dtGenderFreq[Sex == 'Female']
dtGenderFreq[, textPercentage := paste(round(percentage * 100), '%',
                                       sep='')]
barplot(
  height=dtGenderFreq[, percentage],
  names.arg=dtGenderFreq[, Class],
  col=dtGenderFreq[, Class],
  ylim=c(0, 1),
  legend.text=dtGenderFreq[, textPercentage],
  ylab='survival rate',
  main='Percentage of females'
)
dtGenderClass <- dtTitanic[, list(n=sum(Freq)), by=c('Survived', 'Sex',
                                                     'Class')]
dtGenderClass[, nTot := sum(n), by=c('Sex', 'Class')]
dtGenderClass[, percentage := n / sum(n), by=c('Sex', 'Class')]
dtGenderClass <- dtGenderClass[Survived == 'Yes']
dtGenderClass[, textPercentage := paste(round(percentage * 100), '%',
                                        sep='')]
dtGenderClass[, colorPlot := rainbow(nrow(dtGenderClass))]
dtGenderClass[, SexAbbr := ifelse(Sex == 'Male', 'M', 'F')]
dtGenderClass[, barName := paste(Class, SexAbbr, sep='')]
dtGenderClass[, barLabel := paste(barName, nTot, sep='\n')]
barplot(
  height=dtGenderClass[, percentage],
  names.arg=dtGenderClass[, barLabel],
  col=dtGenderClass[, colorPlot],
  xlim=c(0, 11),
  ylim=c(0, 1),
  ylab='survival rate',
  legend.text=dtGenderClass[, textPercentage]
)
dtTitanic[, nTot := sum(Freq), by=c('Sex', 'Class', 'Age')]
dtTitanic[, percentage := Freq / nTot]
dtAll <- dtTitanic[Survived == 'Yes', ]
dtAll[, ClassAbbr := substring(Class, 1, 1)]
dtAll[, SexAbbr := ifelse(Sex == 'Male', 'M', 'F')]
dtAll[, AgeAbbr := ifelse(Age == 'Child', 'C', 'A')]
dtAll[, textLegend := paste(ClassAbbr, SexAbbr, AgeAbbr, sep='')]
dtAll[, colorPlot := rainbow(nrow(dtAll))]
dtAll[, labelPerc := paste(round(percentage * 100), '%', sep='')]
dtAll[, label := paste(labelPerc, nTot, sep='\n')]
barplot(
  height=dtAll[, percentage],
  names.arg=dtAll[, label],
  col=dtAll[, colorPlot],
  xlim=c(0, 23),
  legend.text=dtAll[, textLegend],
  cex.names=0.5
)

library('rpart')
library('rpart.plot')
dtLong <- dtTitanic[
  , list(Freq = rep(1, Freq)),
  by=c('Survived', 'Sex', 'Age', 'Class')
  ]
dtLong[, Freq := NULL]
dtLong[, Survived := ifelse(Survived == 'Yes', 1, 0)]
head(dtLong)
help(rpart)
formulaRpart <- formula('Survived ~ Sex + Age + Class')
treeRegr <- rpart(
  formula=formulaRpart,
  data=dtLong
)
prp(treeRegr)
treeClass = rpart(
  formula='Survived ~ Sex + Age + Class',
  data=dtLong,
  method='class'
)
prp(treeClass)

#Building a ML model
library('randomForest')
dtDummy <- copy(dtLong)
dtDummy[, Male := Sex == 'Male']
dtDummy[, Sex := NULL]
dtDummy[, Child := Age == 'Child']
dtDummy[, Age := NULL]
dtDummy[, Class1 := Class == '1st']
dtDummy[, Class2 := Class == '2nd']
dtDummy[, Class3 := Class == '3rd']
dtDummy[, Class := NULL]
formulaRf <- formula('Survived ~ Male + Child + Class1 + Class2 +
                     Class3')
forest <- randomForest(
  formula=formulaRf,
  data=dtDummy
)
forest$ntree
forest$mtry
forest$type
forest1 <- randomForest(formula=formulaRf,
                        data=dtDummy,
                        ntree=1000,
                        mtry=3,
                        sampsize=1500
)

#Using the model to predict new outcomes
rowRandom <- dtDummy[100]
rowRandom
predict(forest, rowRandom)

prediction = predict(forest, dtDummy)
sample(prediction, 6)