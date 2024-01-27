#import the given "UScereal" data
#R1

data <- read.csv("UScereal1.csv")
str(data)
head(data)
summary(data)
data


result <- aggregate(protein ~ mfr, data = data, FUN = max)
print(result)
library(ggplot2)

ggplot(data, aes(x = mfr, y = fibre)) +geom_boxplot() +labs(title = "Fiber Distribution by Manufacturer", x = "Manufacturer", y = "Dietary Fiber (g)")


#R2

missing_values <- sapply(data, function(x) {
  sum(is.na(x))
})
print(missing_values)

print(names(data)[which(missing_values > 0)])

clean = na.omit(data)

summary(clean)


#R3


library(ggplot2)

# plot to analyze the spread of Fiber for each Manufacturer
ggplot(data, aes(x = mfr, y = fibre)) + geom_boxplot(fill="grey" , color="black") +  labs(title = "Fiber Preference by Manufacturer",x = "Manufacturer",y = "Fiber (grams)")

##Findings: From the bar plot we can observe that manufacturer N has given preference to cereals with fibre values ranging roughly from 5 to 20.
# However, all the other manufacturers gave preference to fibre values in cereals  ranging from roughly 0 to 10.
# In conclusion, we can say manufacturer N prferes higher fibre proteins than other manufacturers.

# Outlier on calories for each shelf

# Box plot to find outlines on calories for each shelf
ggplot(data, aes(x = as.factor(shelf), y = calories)) + geom_boxplot() + labs(title = "Outliers on Calories for Each Shelf", x = "Shelf", y = "Calories") + theme_minimal()

## Findings: In this boxplot we can observe, shelf 3 has the most no.of outliers in
# the calorie ranges, with shelf 2 begin the next shelf with maximum no.of outliers.



# Scatter plot matrix to explore all numeric variables
ggplot(data, aes(x = calories, y = protein)) + geom_point() + labs(title = "Scatterplot for Numeric Variables", x = "Calories", y = "Protein") + theme_minimal()


#finding
#we have taken x as calories and y as protein , and the protein to calories ratio is higher in the 100 - 
#200 range and when going to 300 - 400 range it is very low


#R4


# Identify the top-four mean variables
mean_values <- colMeans(data[, c("calories", "protein", "fat", "sodium", "fibre", "carbo", "sugars", "potassium")], na.rm = TRUE)
top_four_mean_variables <- names(sort(mean_values, decreasing = TRUE)[1:4])

# Create the data frame GreaterMeanFour
GreaterMeanFour <- data[, c("Name", top_four_mean_variables)]

# Correlation matrix
correlation_matrix <- cor(data[, top_four_mean_variables], use = "complete.obs")

# Plot the correlation matrix
library(corrplot)
corrplot(correlation_matrix, method = "circle")

# Assuming you want to use calories to predict protein
model <- lm(protein ~ calories, data = data)

# Plot the linear regression line
ggplot(data, aes(x = calories, y = protein)) + geom_point() + geom_smooth(method = "lm", se = FALSE, color = "red") + labs(title = "Simple Linear Regression: Protein vs. Calories", x = "Calories", y = "Protein") + theme_minimal()



#R5


# Predictions before removing outliers
predictions_before <- predict(model, newdata = data.frame(calories = 150))

# Identify and remove outliers
outliers <- which(model$residuals > quantile(model$residuals, 0.975) | model$residuals < quantile(model$residuals, 0.025))
us_cereal_no_outliers <- data[-outliers, ]

# Create a new model without outliers
model_no_outliers <- lm(protein ~ calories, data = us_cereal_no_outliers)

# Predictions after removing outliers
predictions_after <- predict(model_no_outliers, newdata = data.frame(calories = 150))

# Show predictions
print(paste("Prediction Before Removing Outliers:", predictions_before))
print(paste("Prediction After Removing Outliers:", predictions_after))

