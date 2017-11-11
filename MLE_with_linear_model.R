#Maximum Likelihood Estimation
#Now with linear model
N <- 100
x <- runif(N)
y <- 5 * x + 3 + rnorm(N)
?runif
x
fit1 <- lm(y~x)
summary(fit1)
plot(x,y)
abline(fit,col="red")
LL <- function(beta0, beta1, mu, sigma){
  R = y -x * beta1 - beta0 #Find residuals
  #Calculate the likelihood for the residuals
  R = suppressWarnings(dnorm(R, mu, sigma)) #log=T can also be used
  #Sum the log likelihoods for all of the data points
  -sum(log(R))
}
fit<-mle(LL,start=list(beta0=2,beta1=1.5,sigma=1),fixed=list(mu=0),nobs=length(y))
summary(fit)
fit2<-mle(LL,start=list(beta0=2,beta1=1.5),fixed=list(mu=0,sigma=1),nobs=length(y))
summary(fit2)
