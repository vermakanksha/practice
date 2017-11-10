#Maximum Likelihood Estimation
#Fitting a Normal Distribution
set.seed(1001)
N <- 100
x <- rnorm(N,mean=3,sd=2)
mean(x) ; sd(x)
#Formulating the log-likelihood function
LL <- function(mu,sigma){
  R=suppressWarnings(dnorm(x,mu,sigma))
  -sum(log(R))
}
hist(x)
library(stats4)
mle(LL, start = list(mu=10,sigma=10))
