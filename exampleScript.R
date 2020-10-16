#create a vector
myVector = 1:10

#index the second entry from the vector
myVector[2]

#create a matrix, 5 rows
myMatrix = matrix(1:10, nrow = 5)

#index the third row from the matrix
myMatrix[3,]

#make data frame
myDataFrame = data.frame(myMatrix)
colnames(myDataFrame) = c("col1", "col2")

#these two things are the same, index third row, second column
myDataFrame[3,2]
myDataFrame$col2[2]


#make data frame, 4 rows 3 cols
dt = data.frame(a = 1:4, b = 5:8, c = 9:12)
#print second col
dt$b

#each row, one at a time
dt[1,]
dt[2,]
dt[3,]
dt[4,]

#each element of the third column, one at a time
dt[1,3]
dt[2,3]
dt[3,3]
dt[4,3]

#for loop to print each row of the data frame
for (line in 1:4){
  x = dt[line,]
  print(x)
}


#this for loop is equivalent to the above
for (line in 1:4){
  print(dt[line,])
}


#logic test
x = 1
if (x > 0){
  print("x is positive")
}else if (x < 0){
  print("x is negative")
}else{
  print("x is equal to zero, be less boring")
}

}
