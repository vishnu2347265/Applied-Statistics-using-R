#Matrix Operations

#1.Create two matrices, matrix_A and matrix_B
matrix_A <- matrix(c(4,10,5,8,16,9,23,45,16),nrow = 3,ncol = 3,byrow = TRUE,dimnames = list(c("A","B","C"),c("X","Y","Z")))
matrix_A
matrix_B <- matrix(c(4,5,6,1,1,3,7,8,9),nrow = 3,ncol = 3,byrow = TRUE,dimnames = list(c("A","B","C"),c("X","Y","Z")))
matrix_B

#2.Calculate the sum of matrix_A and matrix_B and store the result in a new matrix named matrix_sum.
matrix_sum = matrix_A+matrix_B
matrix_sum

#3.Calculate the difference between matrix_A and matrix_B and store the result in a new matrix named matrix_diff.
#difference of matrix's
matrix_diff = matrix_A-matrix_B
matrix_diff

#4.Multiply matrix_A by a scalar value of 2 and store the result in a new matrix named matrix_mul
matric_mult = matrix_A*2
matric_mult

#5.Calculate the product of matrix_A and matrix_B and store the result in a new matrix named matrix_product.
matrix_product = matrix_A*matrix_B
matrix_product

#6.Find the transpose of matrix_A and store the result in a new matrix named matrix_A_transpose.
matrix_A_transpose=t(matrix_A)
matrix_A_transpose

#7.Calculate the determinant of matrix_B and store it in a variable named determinant_B.
determinant_B=det(matrix_B)
determinant_B

#8.Invert matrix_B to obtain the inverse matrix and store it in a new matrix named matrix_B_inverse.
matrix_B_inverse= solve(matrix_B)
matrix_B_inverse

#9.Check if matrix_B is orthogonal (i.e., its transpose is equal to its inverse).
matrix_B_transpose=t(matrix_B)
matrix_B_transpose==matrix_B_inverse

#10.Calculate the element-wise square root of matrix_A and store the result in a new matrix named matrix_A_sqrt
matrix_A_sqrt =  sqrt(matrix_A)
matrix_A_sqrt

#11.Calculate the mean of all the elements in matrix_B.
print(mean(matrix_B))

#12.Calculate the sum of each column in matrix_A.
sum_matrix_A = c(sum(matrix_A[,1]),sum(matrix_A[,2]),sum(matrix_A[,3]))
sum_matrix_A

#13.Calculate the row means of matrix_B.
row_means_matrix_B <- c(mean(matrix_B[1,]),mean(matrix_B[2,]),mean(matrix_B[3,]))
row_means_matrix_B

#14.Extract the second row of matrix_A and store it in a vector named second_row_A.
second_row_A <- c(matrix_A[2,])
second_row_A

#15.Extract the third column of matrix_B and store it in a vector named third_column_B.
third_column_B <- matrix_B[,3]
third_column_B