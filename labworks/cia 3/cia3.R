setwd("D:/Progrmming/Applied-Statistics-using-R/labworks/cia 3")
data=read.csv("Originaldata.csv")
View(data)

#Problem Statement
#Explore whether there are significant differences in the average frequency of engaging in physical exercise per week among different age groups (15-25, 26-30, 31-35).


#One-Sample t-Test

#H0:The average frequency of engaging in physical exercise per week for individuals aged 15-25 is equal to a specified value.
#H1: The average frequency of engaging in physical exercise per week for individuals aged 15-25 is not equal to the specified value.

# Assuming your dataset is named 'data' and the relevant variable is 'X4..How.often.do.you.engage.in.physical.exercise.per.week.'
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

if (t_test_result$p.value < 0.05) {
  cat("Reject the null hypothesis. There is significant evidence that the average frequency of engaging in physical exercise per week for individuals aged 15-25 is different from the specified value.\n")
} else {
  cat("Fail to reject the null hypothesis. There is not enough evidence to suggest a significant difference in the average frequency of engaging in physical exercise per week for individuals aged 15-25 from the specified value.\n")
}

# One-Sample t-Test Results:

# Test Statistic: -4.566032
# p-value: 1.019799e-05

# Conclusion:
#The one-sample t-test was conducted to examine whether the average frequency of engaging in physical exercise per week for individuals aged 15-25 is different from a specified value. The test statistic is -4.566032, and the p-value is 1.019799e-05.

# Inference:
#Since the p-value (1.019799e-05) is less than the significance level of 0.05, we reject the null hypothesis. There is significant evidence that the average frequency of engaging in physical exercise per week for individuals aged 15-25 is different from the specified value. This suggests that, based on the sample data, the observed average frequency is statistically different from the specified value.

#This finding may have implications for understanding the exercise habits of individuals aged 15-25 and could be relevant for interventions or recommendations aimed at promoting a specific level of physical activity within this age group.




#Two-Sample t-Test(Independent):

#H0:The average frequency of engaging in physical exercise per week for individuals aged 15-25 is equal to the average for individuals aged 26-30.
#H1:The average frequency of engaging in physical exercise per week for individuals aged 15-25 is not equal to the average for individuals aged 26-30.

# Assuming your dataset is named 'data' and the relevant variable is 'X4..How.often.do.you.engage.in.physical.exercise.per.week.'
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

if (t_test_result$p.value < 0.05) {
  cat("Reject the null hypothesis. There is significant evidence that the average frequency of engaging in physical exercise per week for individuals aged 15-25 is different from the average for individuals aged 26-30.\n")
} else {
  cat("Fail to reject the null hypothesis. There is not enough evidence to suggest a significant difference in the average frequency of engaging in physical exercise per week between individuals aged 15-25 and 26-30.\n")
}

# Test Statistic: -0.4999944
# p-value: 0.6370618

# Conclusion:
#The two-sample t-test (independent) was performed to investigate whether the average frequency of engaging in physical exercise per week differs between individuals aged 15-25 and individuals aged 26-30. The test statistic is -0.4999944, and the p-value is 0.6370618.

# Inference:
#Since the p-value (0.6370618) is greater than the significance level of 0.05, we fail to reject the null hypothesis. There is not enough evidence to suggest a significant difference in the average frequency of engaging in physical exercise per week between individuals aged 15-25 and 26-30. This implies that, based on the sample data, the observed differences in exercise frequency between the two age groups are not statistically significant.

#The findings suggest that, in this sample, the exercise habits of individuals aged 15-25 are comparable to those of individuals aged 26-30. Further investigation or consideration of additional factors may be necessary to better understand the factors influencing exercise frequency within these age groups.




#One-Way ANOVA
#H0:The average frequency of engaging in physical exercise per week is the same across all age groups (15-25, 26-30, 31-35).
#H1: At least one age group has a different average frequency of engaging in physical exercise per week

# Assuming your dataset is named 'data' and the relevant variable is 'X4..How.often.do.you.engage.in.physical.exercise.per.week.'
data$exercise_frequency <- factor(data$X4..How.often.do.you.engage.in.physical.exercise.per.week., 
                                  levels = c("Never", "1 - 2 times", "3 - 4 times", "5 or more times"),
                                  labels = c(0, 1, 3.5, 5)) 

data$exercise_frequency <- as.numeric(as.character(data$exercise_frequency))

data$age_group <- cut(data$X1..Age, breaks = c(15, 25, 30, 35), labels = c("15-25", "26-30", "31-35"))

data_no_missing <- na.omit(data)

anova_result <- aov(exercise_frequency ~ age_group, data = data_no_missing)

cat("One-Way ANOVA Results:\n")
print(summary(anova_result))

#Conclusion:

#The One-Way ANOVA results indicate that there is not enough evidence to reject the null hypothesis (H0), suggesting that the average frequency of engaging in physical exercise per week is similar across all age groups (15-25, 26-30, 31-35). The p-value obtained from the analysis is 0.595, which is greater than the common significance level of 0.05. Therefore, we fail to find significant differences in exercise frequency among different age groups.

#Inference:

#The lack of significance in the ANOVA test suggests that, based on the available data, age may not be a significant factor influencing the frequency of engaging in physical exercise per week. It's essential to interpret these results cautiously and consider the limitations, such as the possibility of insufficient variability in the dataset. Further investigations or additional data collection may be needed to draw more conclusive insights into the relationship between age and exercise frequency.




#Two-Way ANOVA
#H01: There is no interaction between age group and gender, and their effects on the average frequency of engaging in physical exercise per week are independent.
#H11:There is an interaction between age group and gender, indicating that their combined effect is not equal to the sum of their individual effects, or at least one of the variables has a significant impact.

# Assuming your dataset is named 'data' and the relevant variables are 'X4..How.often.do.you.engage.in.physical.exercise.per.week.', 'X2..Gender', 'X1..Age'

data$exercise_frequency <- factor(data$X4..How.often.do.you.engage.in.physical.exercise.per.week., 
                                  levels = c("Never", "1 - 2 times", "3 - 4 times", "5 or more times"),
                                  labels = c(0, 1, 3.5, 5))  # Assigning numerical values based on the midpoints

data$exercise_frequency <- as.numeric(as.character(data$exercise_frequency))

data$age_group <- as.factor(cut(data$X1..Age, breaks = c(15, 25, 30, 35), labels = c("15-25", "26-30", "31-35")))
data$gender <- as.factor(data$X2..Gender)

two_way_anova_result <- aov(exercise_frequency ~ age_group * gender, data = data)

cat("Two-Way ANOVA Results:\n")
print(summary(two_way_anova_result))

# Two-Way ANOVA Results:

#                   Df Sum Sq Mean Sq F value  Pr(>F)   
#age_group          2    3.5   1.754   0.573 0.56480   
#gender             2   38.3  19.139   6.256 0.00244 **
#age_group:gender   2    2.7   1.339   0.438 0.64623   
#Residuals        153  468.0   3.059                   
#---
#Signif. codes:  0 '' 0.001 '' 0.01 '' 0.05 '.' 0.1 ' ' 1
#2 observations deleted due to missingness
# Conclusion:
#A Two-Way ANOVA was conducted to explore the interaction between age group and gender on the average frequency of engaging in physical exercise per week. The results indicate that age group and gender both have a significant main effect on exercise frequency. However, the interaction between age group and gender does not show a significant effect.

# Inference:
#The findings suggest that, based on this sample, there is not enough evidence to suggest an interaction between age group and gender in influencing the average frequency of engaging in physical exercise per week. While both age group and gender individually contribute to differences in exercise frequency, their combined effect is not significantly different from the sum of their individual effects.

#Further investigation or consideration of additional factors may be necessary to understand the nuanced relationships between age group, gender, and exercise habits. It is important to interpret these results in the context of your specific study and population.





#Problem Statement - 2
#Examine if there is a significant difference in the average time spent on each exercise session between employed and unemployed individuals.
#One-Sample t-Test
#H0: The average time spent on each exercise session for employed individuals is equal to a specified value.
#H1: The average time spent on each exercise session for employed individuals is not equal to the specified value


# Convert the variable to numeric
data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session... <- as.numeric(as.character(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session...))

# Calculate the overall mean of the variable
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

# Check if the p-value is less than the significance level (commonly 0.05)
if (t_test_result$p.value < 0.05) {
  cat("Reject the null hypothesis. There is significant evidence that the average time spent on each exercise session for employed individuals is different from the overall mean.\n")
} else {
  cat("Fail to reject the null hypothesis. There is not enough evidence to suggest a significant difference in the average time spent on each exercise session for employed individuals from the overall mean.\n")
}

#Based on the One-Sample t-Test conducted for employed individuals on the average time spent on each exercise session, we obtained the following results:

#Test Statistic: -0.540969
#p-value: 0.5942215

#Conclusion:
#The p-value obtained from the t-test is greater than the significance level (commonly 0.05). Therefore, we fail to reject the null hypothesis. This implies that there is not enough evidence to suggest a significant difference in the average time spent on each exercise session for employed individuals compared to the overall mean.

#Inference:
#The results suggest that, based on the available data, employed individuals, on average, do not spend a significantly different amount of time on each exercise session compared to the overall mean. This lack of statistical significance indicates that the observed difference, if any, is likely due to random variability. Further studies or a larger dataset may be needed to draw more robust conclusions about the average time spent on exercise sessions for employed individuals.




#Two-Sample t-Test(Independent):
#H0:The average time spent on each exercise session for employed individuals is equal to the average for unemployed individuals.
#H1:The average time spent on each exercise session for employed individuals is not equal to the average for unemployed individuals.


# Specify the null hypothesis value
specified_value <- 30

# Extract data for employed individuals
employed_data <- data[data$X3..Occupation == "employed", ]

# Perform One-Sample t-Test
t_test_result <- t.test(employed_data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session..., mu = specified_value)

# Display the results
cat("One-Sample t-Test Results for Employed Individuals:\n")
cat("Test Statistic:", t_test_result$statistic, "\n")
cat("p-value:", t_test_result$p.value, "\n")

# Check if the p-value is less than the significance level (commonly 0.05)
if (t_test_result$p.value < 0.05) {
  cat("Reject the null hypothesis. There is significant evidence that the average time spent on each exercise session for employed individuals is different from 30 minutes.\n")
} else {
  cat("Fail to reject the null hypothesis. There is not enough evidence to suggest a significant difference in the average time spent on each exercise session for employed individuals from 30 minutes.\n")
}
#Your one-sample t-test results for employed individuals indicate the following:

#Test Statistic:0.3735354
#p-value:0.7124944

#Given a specified value of 30 minutes for the null hypothesis, the conclusion is as follows:

#Fail to reject the null hypothesis. There is not enough evidence to suggest a significant difference in the average time spent on each exercise session for employed individuals from 30 minutes.

#This means that based on the sample data, you don't have sufficient evidence to claim that the average time spent on each exercise session for employed individuals is significantly different from 30 minutes. The p-value is greater than the commonly used significance level of 0.05, indicating that the observed difference is not statistically significant.




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

# Check if there is a p-value for the overall F-test


#Conclusion:
#Fail to reject the null hypothesis (p-value = 0.397). There is no significant evidence to suggest a difference in the average time spent on each exercise session across employed and unemployed individuals.

#Inference:
#The observed variability in exercise session time is likely due to random chance, as the p-value is higher than the significance level (0.05). We lack sufficient statistical evidence for a significant difference in exercise time between the occupation groups.





#Two-Way ANOVA
#H0: There is no interaction between employment status and gender, and their effects on the average time spent on each exercise session are independent.
#H1:There is an interaction between employment status and gender, indicating that their combined effect is not equal to the sum of their individual effects, or at least one of the variables has a significant impact.

# Create a two-way ANOVA model
# Clean up variable names
data$ExerciseTime <- as.numeric(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session...)

# Check and handle missing values
data <- data[complete.cases(data), ]

# Check and handle infinite or NaN values
if (any(!is.finite(data$ExerciseTime))) {
  stop("Error: Infinite or NaN values found in the dependent variable.")
}

# Check data type
str(data$ExerciseTime)

# Create a two-way ANOVA model
anova_model <- aov(data$ExerciseTime ~ data$X3..Occupation + data$X2..Gender, data = data)

# Display the results
cat("Two-Way ANOVA Results:\n")
print(summary(anova_model))

# Check if there is a p-value for the interaction term


#Conclusion and Inference:

#In the Two-Way ANOVA conducted to assess the impact of occupation and gender on the average time spent on exercise sessions:

#1. Occupation Effect:No significant difference was observed in exercise time among different occupations (p = 0.3631).
#2. Gender Effect:A significant gender difference exists in exercise time (p = 0.0027).
#3. Interaction Effect:Due to insufficient data variability, the assessment of interaction effects was inconclusive.

#Inference: 
#Occupation does not significantly influence exercise time. Gender has a significant effect on exercise time. Further refinement of data is necessary to comprehensively explore interaction effects.




# Assuming you have a data frame named 'data' with columns 'AgeGroup' and 'exercise_frequency'
# 'AgeGroup' is a categorical variable (15-25, 26-30, 31-35), and 'exercise_frequency' is the numeric variable of interest

# Fit Simple Linear Regression
model <- lm(data$X4..How.often.do.you.engage.in.physical.exercise.per.week.~ data$X1..Age, data = data)

# Print the summary of the regression model
summary(model)
plot(model)

# Assuming you have a data frame named 'df' with columns 'EmploymentStatus' and 'TimeSpentPerSession'
# 'EmploymentStatus' is a categorical variable (Employed, Unemployed), and 'TimeSpentPerSession' is the numeric variable of interest

# Fit Simple Linear Regression
model <- lm(data$X5..On.average..how.many.minutes.do.you.spend.on.each.exercise.session... ~ data$X3..Occupation, data = data)

# Print the summary of the regression model
summary(model)
plot(model)