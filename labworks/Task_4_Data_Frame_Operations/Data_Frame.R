#Create a sample dataset in a CSV file named "employee_data.csv." The dataset should contain the following columns:
#Employee ID: A unique identifier for each employee.
#Name: The name of the employee.
#Department: The department in which the employee works.
#Salary: The monthly salary of the employee (in USD).
#Joining Date: The date on which the employee joined the company (in YYYY-MM-DD format).

employee_data <- data.frame(
  Employee_ID = 101 : 110,
  Name = c("Vishnu","Aaron","Alwin","Amar","Akhil","Ashwin","Abin","Sidharth",
           "Mohit","Joe"),
  Department = c("R&D","IT","Finance","Marketing","HR","Finance","HR","IT",
                 "R&D","Finance"),
  Salary = c(90000, 68000, 33500, 33500, 90900, 48200, 21300, 66100, 85900, 16400),
  Joining_Date = c("2020-04-16", "2018-10-07", "2021-05-30", "2018-12-16", "2016-11-20", "2019-01-03", "2020-06-01", "2017-06-17", "2020-02-25", "2019-05-14")
)

# Save the data frame to a CSV file
write.csv(employee_data, "employee_data.csv", row.names = FALSE)

#Load the dataset from "employee_data.csv" into a data frame in R.
employee_data <- read.csv("employee_data.csv")
employee_data

#Display the structure of the data frame, including column names and data types.
str(employee_data)

#Calculate and add a new column named "Years of Service" to the data frame, representing the number of years each employee has worked in the company.

employee_data$Joining_Date <- as.Date(employee_data$Joining_Date,format = "%Y-%m-%d") 
employee_data$Current_Date <- Sys.Date()  #system current date
employee_data$Years_of_Service <- as.numeric(difftime(employee_data$Current_Date, employee_data$Joining_Date, units = "days") / 365.25)
employee_data$Current_Date <- NULL
employee_data

#Create a new data frame named "Senior Employees" containing records of employees who have worked for the company for 5 or more years.
Senior_Employees <- subset(employee_data, Years_of_Service >= 5)
Senior_Employees

#Calculate and print the average salary of employees in each department.
avg_salary_by_dept <- aggregate(Salary ~ Department, data = employee_data, FUN = mean)
print(avg_salary_by_dept)


#Determine the highest and lowest salaries in the entire dataset and identify the employees with these salaries.
highest_salary <- max(employee_data$Salary)
lowest_salary <- min(employee_data$Salary)

employees_with_highest_salary <- subset(employee_data, Salary == highest_salary)
employees_with_lowest_salary <- subset(employee_data, Salary == lowest_salary)

cat("Highest Salary: $", highest_salary, "\n")
cat("Employees with Highest Salary:\n")
print(employees_with_highest_salary)

cat("Lowest Salary: $", lowest_salary, "\n")
cat("Employees with Lowest Salary:\n")
print(employees_with_lowest_salary)

#Create a bar plot to visualize the number of employees in each department.

# Create a bar plot with blue bars
department_counts <- table(employee_data$Department)


barplot(department_counts, 
        main = "Number of Employees in Each Department",
        xlab = "Department",
        ylab = "Number of Employees",
        col = "blue",
        border = "black",
        cex.names = 0.7 
)

#Generate a scatter plot to explore the relationship between years of service and salary.

plot(employee_data$Years_of_Service, employee_data$Salary,
     main = "Scatter Plot of Years of Service vs. Salary",
     xlab = "Years of Service",
     ylab = "Salary",
     pch = 20,  
     col = "blue"
     )

#Save the "Senior Employees" data frame as a CSV file named "senior_employees.csv."
write.csv(Senior_Employees, "Senior_Employees.csv", row.names = FALSE)

