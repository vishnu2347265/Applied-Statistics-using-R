str(precip)
precip[1:70]
precip[1:4]

str(rivers)
rivers[1:141]
rivers[1:4]

str(discoveries)
discoveries[1:100]
discoveries[1:4]

help("stripchart")
stripchart(precip, xlab = "rainfall")
stripchart(precip,method = "jitter" , xlab = "rainfall")
stripchart(rivers,method = "jitter",xlab = "length")
stripchart(discoveries,xlab = "numbers", method = "overplot")
stripchart(discoveries,xlab = "numbers", method = "jitter")
stripchart(discoveries,xlab = "numbers", method = "stack")

help("hist")
hist(rivers)
hist(rivers,freq = FALSE)
hist(rivers,freq = TRUE)
hist(rivers,freq = TRUE , breaks = 10, main = "H i s t o g r a m of rivers WITH BREAK 10 ")
hist(rivers, breaks = 200, main = "histogrAM OF RIVERS WITH BREAK 200")

#create xlab ylab color for line , legend mtcars all things

#MTCARS HISTOGRAM AND STRIPCHART
cars = mtcars
print(cars)
str(cars)

cars$cyl = as.ordered(cars$cyl)
cars$gear = as.ordered(cars$gear)
cars$carb = as.ordered(cars$carb)

cars$vs = as.factor(cars$vs)
cars$am = as.factor(cars$am)
hist(cars$mpg)
barplot(height = table(cars$cyl),xlab = "no of cylinder")



