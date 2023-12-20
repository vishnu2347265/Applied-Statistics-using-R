#one sample 
#hypothesis testing
capt_crisp <- data.frame(weight=c(15.5,16.2,16.1,15.8,15.6,16.0,15.8,15.9,16.2))
capt_crisp
??t.test
x_bar = mean(capt_crisp$weight)
x_bar
s=sd(capt_crisp$weight)
s
mu_o=16
n=length(capt_crisp$weight)
n
#t score
## Default S3 method:
t.test(capt_crisp,
       alternative = c("two.sided", "less", "greater"),
       mu = 16, paired = FALSE, var.equal = FALSE,
       conf.level = 0.95)

t.test(cap)



#NUMBER 2

x <- c(70,82,78,74,94,82)
n <- length(x)
y <- c(64,72,60,76,72,80,84,68)
m<-length(y)
x_bar <- mean(x)
y_bar <- mean(y)
s_x = sd(x)
s_y = sd(y)

t2 = (x_bar - y_bar)/(sqrt(((s_x)**2/n) + (s_y)**2/n))
print(t2)

t.test(x,y)
