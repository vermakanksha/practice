#Non Linear Regression on cars dataset
library(MASS)
cars
y=cars$dist
x=cars$speed
plot(y~x)
nl = nls(y~a+b*I(x^z),start=list(a=1,b=1,z=1))
nl
plot(y~x)
lines(x,fitted(nl),col="blue")
