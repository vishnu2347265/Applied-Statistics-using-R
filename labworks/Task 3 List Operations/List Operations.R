#Create a list named employee representing the details of an employee with the following components:
#EmployeeID: A unique employee identifier (as a numeric value).
#Name: The employee's full name (as a string).
#Salary: The employee's monthly salary (as a numeric value).
#Departments: A vector containing the names of the departments the employee is associated with (as strings).
#Display the entire content of the employee list.

employee <- list(EmployeeID = 101, Name= "Shawn", Salary = 51599, Departments = c("Marketing","Finance"))
employee

#Calculate and print the employee's annual salary (12 times the monthly salary).
annual_salary = employee$Salary *12
annual_salary

#Update the employee's name to a different name.
employee$Name = "Nintu"
employee


#Add a new department to the Departments vector for the employee.
employee$Departments = c(employee$Departments,"Sales")
employee


#Create a list named organization to represent an organization with the following components:
#Name: The name of the organization (as a string).
#Employees: A list containing details of at least three employees, using the structure created in Task 1.

organization <- list(Name = "Oracle", Employees = list(employee,
                                                       list(EmployeeID = 102,Name= "Vishnu", 
                                                            Salary = 86399, Departments = c("Development","Management")),
                                                       list(EmployeeID = 103, Name= "Alwin", 
                                                            Salary = 76431, Departments = c("Sales","Management"))))
#Display the entire content of the nested list organization.
organization

#Access and print the annual salary of the second employee in the organization.
Second_emp = organization$Employees[[2]]$Salary*12
Second_emp

#Access and print the name of the organization.
organization$Name

#Create a new list named department_employees that groups employees by department.Each department should have a list of employees associated with it.
department_employees <- list()

for (emp in organization$Employees) {
  departments <- emp$Departments
  for (dept in departments) {
    if (dept %in% names(department_employees)) {
      department_employees[[dept]] <- c(department_employees[[dept]], emp$Name)
    } else {
      department_employees[[dept]] <- list(emp$Name)
    }
  }
}
department_employees


#Print each list created in the script to show the structure and content of the lists after performing the operations in Tasks 1-5.
str(department_employees);department_employees
str(employee);employee
str(organization$Employees);organization$Employees
str(organization);organization


#Also, print the department_employees list to demonstrate how employees are grouped by department.

print("Department Employees List:")
print(department_employees)
