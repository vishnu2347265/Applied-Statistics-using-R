

#create a sample dataset
student_scores <- data.frame(
  student_id = 1:100,
  gender = sample(c("Male","Female"),100,replace = TRUE),
  age = sample(18:25,100,replace = TRUE),
  ExamScore = round(runif(100,min = 50,max=100),1)
)

#SAVE THE DATASET AS CSV FILE
write.csv(student_scores,"student_scores.csv",row.names = FALSE)



#CSV FILE
print(getwd())
setwd("D:\\Progrmming\\Applied-Statistics-using-R\\classworks")
data <- read.csv("student_scores.csv")

print(getwd())
print(data)
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))

#import a data frame.
data <- read.csv("student_scores.csv")

#get the max marks from data frame
Mark <- max(data$ExamScore)
print(Mark)
#get the person details having max marks
retval <- subset(data, ExamScore == max(ExamScore))
print(retval)

#viewing the dataset
View(data)
#first 6 data // default 6 
head(data)
head(data,3)
#last datas
tail(data)
tail(data,10)



