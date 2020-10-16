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


#iris sepal length example

#read data frame into R
dt = read.csv("iris.csv", header = T, stringsAsFactors = F)

#initiate variables to count total sepal length (*.total)
#and total number of each observation (*.count)
setosa.total = 0
versicolor.total = 0
verginica.total = 0
setosa.count = 0
versicolor.count = 0
verginica.count = 0

#loop to run through each row of dt
for (file in length(dt$Species)){
  #if statement tests if the species for this row is "setosa"
  if (dt$Species[file] == "setosa"){
    #if true, add sepal length to existing .total variable
    #also add count variable (existing value +1)
    setosa.total = setosa.total + dt$Sepal.Length[file]
    setosa.count = setosa.count + 1
    #else if to then ask if the row is "versicolor" species
  } else if (dt$Species[file] == "versicolor"){
    #same thing as above for setosa species
    versicolor.total = versicolor.total + dt$Sepal.Length[file]
    versicolor.count = versicolor.count + 1
    #all other species will be captured by simply calling "else"
  } else{
    #same thing as above for other species
    verginica.total = verginica.total + dt$Sepal.Length[file]
    verginica.count = verginica.count + 1
  }
  #if statement to check if the loop is on the last row
  #this works since we use the length(dt$Species) argument
  #that ended the set our for loop goes through
  #i.e. when we called for (file in 1:length(dt$species))
  if (file == length(dt$Species)){
    setosa.avg = setosa.total / setosa.count
    vers.avg = versicolor.total / versicolor.count
    verg.avg = verginica.total / verginica.count
  }
}


