install.packages("moments")
library(moments)
x <- c(40,41,42,43,50)
print(skewness(x))
hist(x)

b<-rnorm(50,10,10)
print(skewness(b))
hist(b)
den = density(b)
plot(den, frame=FALSE,col="blue" ,main = "density plot")

set.seed(3548148)
xnorm <- rnorm(5000)
head(xnorm)

hist(xnorm,prob=TRUE)
lines(density(xnorm),col=2,lwd=10)

set.seed(123456789)
xnorm <- rnorm(5000)
head(xnorm)

hist(xnorm,prob=TRUE)
lines(density(xnorm),col=2,lwd=10)

help("kurtosis")

x<-c(rep(61,each=10),rep(64,each=18),
     rep(65,each=23),rep(64,each=18),rep(61,each=10),rep(64,each=18),
     rep(61,each=10),rep(64,each=18))
x<-rnorm(100)
print(kurtosis(x))
hist(x)

mean(mtcars$mpg)
mode(mtcars$mpg)
median(mtcars$mpg)

range(mtcars$wt)


hp <- mtcars$hp
print(hp)
hist(hp)  
skewness(hp)  
kurtosis(hp)  
mean(hp)  
mode(hp)
median(hp)

dis<-mtcars$disp
plot(skewness(dis))
kurtosis(dis)
plot(density(dis),col="blue",frame=FALSE,main = "plot")

