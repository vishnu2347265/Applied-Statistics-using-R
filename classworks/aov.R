install.packages(c("ggubr"))
library(ggplot2)
library(AICcmodavg)
library(ggubr)
library(tidyverse)
library(broom)

crop.data <- read.csv("D:/Progrmming/Applied-Statistics-using-R/classworks/crop.data.csv")
summary(crop.data)
one.way <- aov(yield~fertilizer,data = crop.data )
summary(one.way)
two.way<- aov(yield ~ fertilizer + density,data = crop.data)
summary(two.way)
interaction <- aov(yield~fertilizer*density,data = crop.data)
summary(interaction)


df <- data.frame( x = c(1,2,3,4,5), y = c(1,5,8,15,26))
df

linear_model <- lm(y ~ x^2, data=df)
summary(linear_model)
plot(linear_model)


predict(linear_model,newdata = data.frame(x=c(15,16,17)))
