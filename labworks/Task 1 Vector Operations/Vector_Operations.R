#Vector Operations
#sales_ problem
#Operations on the data using vector arithmetic, sorting, and reverse sorting in R.

#1.Create a vector named sales_data 
sales_data <- c(45,60,35,75,80,62,48,53,69,72,40,55);sales_data

#2.Calculate the total annual sales
total_annual_sales = sum(sales_data)
cat("Total Annual Sales : $",total_annual_sales)

#3.Compute the monthly average sales
avg= total_annual_sales/12
cat("Montly Average Sales : $",avg)

#4.Determine the month with the highest sales and the lowest sales
month <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October"," November", "December")
sales_max_index= order(sales_data,decreasing = TRUE)[1]
cat("Month with Highest Sales :",month[sales_max_index]," with Sales :$",sales_data[sales_max_index])
sales_min_index=order(sales_data,decreasing = FALSE)[1]
cat("Month with Lowest Sales :",month[sales_min_index]," with Sales :$",sales_data[sales_min_index])

#5.Increase the sales figure for the third month (March) by 10%.
sales_data[3]=sales_data[3]+(sales_data[3]*.1)
cat("Increased sales figure for the third month by 10% :$",sales_data[3])

#6.Sort the sales_data vector in ascending order and create a new vector named sorted_sales.
sorted_sales = sort(sales_data)
cat("Sorted Sales data : ",sorted_sales)

#7.Sort the sales_data vector in descending order and create a new vector named reverse_sorted_sales.
reverse_sorted_sales=sort(sales_data,decreasing = TRUE)
cat("Reverse Sorted Sales Data : ",reverse_sorted_sales)

#8.Calculate the median sales value from the sorted_sales vector.
median_of_sales_data = median(sorted_sales)
cat("Median of Sales Data :",median_of_sales_data)
