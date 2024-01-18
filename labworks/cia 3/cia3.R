setwd("D:/Progrmming/Applied-Statistics-using-R/labworks/cia 3")
data=read.csv("Originaldata.csv")


# Assuming your data set is named 'data' and the relevant variable is 'X4..How.often.do.you.engage.in.physical.exercise.per.week.'
data$exercise_frequency <- factor(data$X4..How.often.do.you.engage.in.physical.exercise.per.week., 
                                  levels = c("Never", "1 - 2 times", "3 - 4 times", "5 or more times"),
                                  labels = c(0, 1, 3.5, 5)) 

data$exercise_frequency <- as.numeric(as.character(data$exercise_frequency))

age_group_15_25 <- data[data$X1..Age >= 15 & data$X1..Age <= 25, "exercise_frequency"]

specified_value <- 3

t_test_result <- t.test(age_group_15_25, mu = specified_value)

cat("One-Sample t-Test Results:\n")
cat("Test Statistic:", t_test_result$statistic, "\n")
cat("p-value:", t_test_result$p.value, "\n")






data$exercise_frequency <- factor(data$X4..How.often.do.you.engage.in.physical.exercise.per.week., 
                                  levels = c("Never", "1 - 2 times", "3 - 4 times", "5 or more times"),
                                  labels = c(0, 1, 3.5, 5))
data$exercise_frequency <- as.numeric(as.character(data$exercise_frequency))

age_group_15_25 <- data[data$X1..Age >= 15 & data$X1..Age <= 25, "exercise_frequency"]
age_group_26_30 <- data[data$X1..Age >= 26 & data$X1..Age <= 30, "exercise_frequency"]

t_test_result <- t.test(age_group_15_25, age_group_26_30)

cat("Two-Sample t-Test Results (Independent):\n")
cat("Test Statistic:", t_test_result$statistic, "\n")
cat("p-value:", t_test_result$p.value, "\n")




data$exercise_frequency <- factor(data$X4..How.often.do.you.engage.in.physical.exercise.per.week., 
                                  levels = c("Never", "1 - 2 times", "3 - 4 times", "5 or more times"),
                                  labels = c(0, 1, 3.5, 5)) 

data$exercise_frequency <- as.numeric(as.character(data$exercise_frequency))

data$age_group <- cut(data$X1..Age, breaks = c(15, 25, 30, 35), labels = c("15-25", "26-30", "31-35"))

data_no_missing <- na.omit(data)
length(data$age_group)
length(data$exercise_frequency)

anova_result <- aov(exercise_frequency ~ age_group, data = data_no_missing)
length(anova_result)

cat("One-Way ANOVA Results:\n")
print(summary(anova_result))





data$exercise_frequency <- factor(data$X4..How.often.do.you.engage.in.physical.exercise.per.week., 
                                  levels = c("Never", "1 - 2 times", "3 - 4 times", "5 or more times"),
                                  labels = c(0, 1, 3.5, 5))  # Assigning numerical values based on the midpoints

data$exercise_frequency <- as.numeric(as.character(data$exercise_frequency))

data$age_group <- as.factor(cut(data$X1..Age, breaks = c(15, 25, 30, 35), labels = c("15-25", "26-30", "31-35")))
data$gender <- as.factor(data$X2..Gender)

two_way_anova_result <- aov(exercise_frequency ~ age_group * gender, data = data)

cat("Two-Way ANOVA Results:\n")
print(summary(two_way_anova_result))






# Convert the variable to numeric
data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session... <- as.numeric(as.character(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session...))


overall_mean <- mean(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session..., na.rm = TRUE)

# Specify the null hypothesis value as the overall mean
specified_value <- overall_mean

# Extract data for employed individuals
employed_data <- data[data$X3..Occupation == "employed", ]

# Perform One-Sample t-Test
t_test_result <- t.test(employed_data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session..., mu = specified_value)

# Display the results
cat("One-Sample t-Test Results for Employed Individuals:\n")
cat("Test Statistic:", t_test_result$statistic, "\n")
cat("p-value:", t_test_result$p.value, "\n")





specified_value <- 30

# Extract data for employed individuals
employed_data <- data[data$X3..Occupation == "employed", ]

# Perform One-Sample t-Test
t_test_result <- t.test(employed_data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session..., mu = specified_value)

# Display the results
cat("One-Sample t-Test Results for Employed Individuals:\n")
cat("Test Statistic:", t_test_result$statistic, "\n")
cat("p-value:", t_test_result$p.value, "\n")






#One-Way ANOVA
#H0:The average time spent on each exercise session is the same across all groups(employed, unemployed).
#H1: At least one group has a different average time spent on each exercise session.


# Create a factor variable for occupation
data$occupation_group <- factor(data$X3..Occupation)

# Perform One-Way ANOVA
anova_result <- aov(X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session... ~ occupation_group, data = data)

# Display the results
cat("One-Way ANOVA Results:\n")
print(summary(anova_result))





# Clean up variable names
data$ExerciseTime <- as.numeric(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session...)

# Check and handle missing values
data <- data[complete.cases(data), ]


# Check data type
str(data$ExerciseTime)

# Create a two-way ANOVA model
anova_model <- aov(data$ExerciseTime ~ data$X3..Occupation + data$X2..Gender, data = data)

# Display the results
cat("Two-Way ANOVA Results:\n")
print(summary(anova_model))

# Check if there is a p-value for the interaction term


# Check for missing values
missing_values <- is.na(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session...)

# Print rows with missing values
print(data[missing_values, ])

# Handle missing values (replace with a specific value or impute)
# For example, replacing NAs with the mean of the variable
data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session...[missing_values] <- mean(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session..., na.rm = TRUE)

# Convert to numeric
data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session... <- as.numeric(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session...)





# Fit Simple Linear Regression
model <- lm(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session... ~ data$X3..Occupation, data = data)

# Print the summary of the regression model
summary(model)
plot(model)

