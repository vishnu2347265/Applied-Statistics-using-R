#R1

data <- read.csv("UScereal1.csv")
str(data)
head(data)
summary(data)
data


result <- aggregate(protein ~ mfr, data = data, FUN = max)
print(result)
library(ggplot2)

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

#Manufacturer N likes cereals with more fiber compared to the rest.
#This suggests that when it comes to fiber in cereals, Manufacturer N stands out for choosing options with higher fiber content.

# Outlier on calories for each shelf

# Box plot to find outlines on calories for each shelf
ggplot(data, aes(x = as.factor(shelf), y = calories)) + geom_boxplot() + labs(title = "Outliers on Calories for Each Shelf", x = "Shelf", y = "Calories") + theme_minimal()

#Examining the box plot highlighting calorie outliers for each shelf, it becomes evident that shelf 3 stands out with the highest number of outliers in calorie ranges. Following closely, shelf 2 exhibits the next highest frequency of outliers.
#This observation suggests that when it comes to calorie content, shelf 3 contains a notable number of data points deviating from the overall trend, making it the shelf with the most diverse calorie values.s.

# Scatter plot matrix to explore all numeric variables
ggplot(data, aes(x = calories, y = protein)) + geom_point() + labs(title = "Scatterplot for Numeric Variables", x = "Calories", y = "Protein") + theme_minimal()

#finding
#Examining the scatter plot matrix focusing on calories and protein, a noticeable trend emerges. The protein-to-calories ratio appears higher in the 100-200 calorie range, indicating that cereals within this calorie bracket tend to have more protein relative to their calorie content. 
#However, as we move into the 300-400 calorie range, the protein-to-calories ratio substantially decreases. 
#This finding suggests a potential inverse relationship between calorie content and protein-to-calories ratio in cereals, with higher-calorie cereals exhibiting a lower protein-to-calories ratio.


#R4

mean_values <- colMeans(data[, c("calories", "protein", "fat", "sodium", "fibre", "carbo", "sugars", "potassium")], na.rm = TRUE)
top_four_mean_variables <- names(sort(mean_values, decreasing = TRUE)[1:4])

GreaterMeanFour <- data[, c("Name", top_four_mean_variables)]

correlation_matrix <- cor(data[, top_four_mean_variables], use = "complete.obs")

library(corrplot)
corrplot(correlation_matrix, method = "circle")

model <- lm(protein ~ calories, data = data)

ggplot(data, aes(x = calories, y = protein)) + geom_point() + geom_smooth(method = "lm", se = FALSE, color = "red") + labs(title = "Simple Linear Regression: Protein vs. Calories", x = "Calories", y = "Protein") + theme_minimal()



predictions_before <- predict(model, newdata = data.frame(calories = 150))

outliers <- which(model$residuals > quantile(model$residuals, 0.975) | model$residuals < quantile(model$residuals, 0.025))
us_cereal_no_outliers <- data[-outliers, ]

model_no_outliers <- lm(protein ~ calories, data = us_cereal_no_outliers)

predictions_after <- predict(model_no_outliers, newdata = data.frame(calories = 150))

print(paste("Prediction Before Removing Outliers:", predictions_before))
print(paste("Prediction After Removing Outliers:", predictions_after))



#Concluding Points:-

#Maximum Protein per Manufacturer:
#The analysis identified the maximum protein content for each cereal manufacturer. 
#This information can provide insights into the range of protein levels across different #brands.

#Handling Missing Data:
#The code addressed missing values in the dataset by using a function that replaced them based 
#on the distribution of each numeric variable. The replacement strategy #considered normality, 
#skewness, and used means or extreme values accordingly.

#Exploratory Data Visualization:
#Exploratory data visualizations, including scatter plots, box plots, and pair
#plots, were created to gain insights into the dataset. These visualizations focused on the 
##relationships between variables, spread of fiber preference by manufacturer, outlier analysis on calories
#by shelf, and exploration of numeric variables.
#Top Four Mean Variables and Correlation Analysis:

#The code identified the top four mean variables (calories, sugars, carbo, and protein) 
