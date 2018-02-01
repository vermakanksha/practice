wbcd <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/wisc_bc_data.csv",
                 stringsAsFactors = FALSE)
str(wbcd)
head(wbcd)
#drop the id feature
wbcd <- wbcd[-1]
ncol(wbcd)
#table of diagnosis
table(wbcd$diagnosis)
#recode diagnosis as a factor
wbcd$diagnosis <- factor(wbcd$diagnosis,
                         levels = c("B","M"),
                         labels = c("Benign","Malignant"))
#table or proportions with more informative labels
round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)
#summarize three numeric features
summary(wbcd[c("radius_mean",
               "area_mean",
               "smoothness_mean")])
#create normalization function
normalize <- function(x) {
  return((x-min(x)) / (max(x)-min(x)))
}
#test normalization function - result should be identical
normalize(c(1,2,3,4,5))
normalize(c(10,20,30,40,50))
#normalize the wbcd data
wbcd_n <- as.data.frame(lapply(wbcd[2:31],
                               normalize))
#confirm that normalization worked
summary(wbcd_n$area_mean)
