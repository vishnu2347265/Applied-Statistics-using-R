#data frame
df3 <- data.frame(col1 = 1:3,
                  col2= c("this","is","text"),
                  col3= c(TRUE,FALSE,TRUE),
                  col4= c(2.5,3.5,4.13),
                 stringsAsFactors = FALSE)
str(df)
df3

#convert multiple vectors,list, boolean to df
v1<- 1:3
v2<- c("this","is","text")
v3<- c(TRUE,FALSE,TRUE)

data.frame(col1 = v1, col2 = v2, col3 = v3)

#convert a list to a df using as.data.frame()
l <- list(item1 = 1:3,
          item2 =  c("this","is","text"),
          item3 =  c(TRUE,FALSE,TRUE))

dim(df)
names(df3) <- c("col.1","col.2","col.3","col.4")
df3
attributes(df3)
df3[2:3, ]

rownames(df) <- c("row.1","row.2","row.3")
df3[c("row.2","row.3"),]
df3[c("col.2","col.4")]
df3[,c("col.2","col.4")]
df[1:2,c(1,3)]
v<- c(1,2,4)
df[,v]
data()
df[,2]
df[,2,drop=FALSE]

head(mtcars)
max(mtcars)
mtcars[mtcars$mpg>20,]
subset(mtcars,mpg>20)
mtcars[mtcars$am,]
mtcars[mtcars$am == 0, ]
mtcars[mtcars$vs==0,]
mtcars[mtcars $cyl==6 ,]
#find the max mpg of 4 cylinder cars
car=max(mtcars$mpg[mtcars$cyl==4])
car
#no of 4 cylinder vehicles whicha are automatic
total=mtcars$am==0 & mtcars$cyl == 4
sum(total)
#find avg heighness of 8 cylinder automatic vehicle
heighness=mtcars$cyl == 8 
heighness
avg=mean(mtcars$wt[mtcars$cyl==8 & mtcars$am==0])
avg
