#create a cumulative score graph for UW and MSU from UWvMSU_1-22-13.txt
#set working directory with UWvMSU_1-22-13.txt file in directory
#create rawscores matrix with data from UWvMSU_1-22-13.txt
rawscores = read.table("UWvMSU_1-22-13.txt", header=TRUE)


#creating two variables to count the UW and MSU cumulative scores
UWcumulative = 0
MSUcumulative = 0
#creating two new empty matrices for the UW scres and MSU scores
UWscores = matrix(nrow = dim(rawscores)[1], ncol = 2)
MSUscores = matrix(nrow = dim(rawscores)[1], ncol = 2)


#loop
#examines each row for either UW or MSU score and then appropriately
#puts the time stamp and cumulative score into the UW or MSU score matrix 
for(i in 1:dim(rawscores)[1]){
  if(rawscores[i,2] == "UW"){
UWcumulative = UWcumulative + as.integer(rawscores[i,3])
UWscores[i,1] = rawscores[i,1]
UWscores[i,2] = UWcumulative
MSUscores[i,1] = rawscores[i,1]
MSUscores[i,2] = MSUcumulative
    
  }
  else if(rawscores[i,2] == "MSU"){
    MSUcumulative = MSUcumulative + as.integer(rawscores[i,3])
    MSUscores[i,1] = rawscores [i,1]
    MSUscores[i,2] = MSUcumulative
    UWscores[i,1] = rawscores[i,1]
    UWscores[i,2] = UWcumulative
    
    
  }
  
}
#plotting the cumulative MSU scores graph over time
plot(as.numeric(MSUscores[,1]), as.integer(MSUscores[,2]), type = "l")
#plotting the cumulative UW score graph over time
lines(UWscores[,1], UWscores[,2])


##part2
#generate random number between 1 and 100
print("I'm thinking of a number between 1-100")
randomnumber = sample (1:100)[1]
#accept input as guess 
print ("Enter Guess")
guess = as.integer(readline())

#loop
#compares guess to random number that is generated 10 times explaining whether 
#the guess is higher, lower, or is exactly the  the random number
#guess is prompted for 9 times through this for loop
for (i in 1:9){
if (guess<randomnumber){
  print ("Higher")
  
}
else if (guess>randomnumber) {
  
  
  print ("lower")
  
}

  
  else if(guess == randomnumber) {
  
  print("Correct!")
  break
  }
  print ("Enter Guess")
  guess = as.integer(readline())
  
  
  
  
}
  
  
#code to complete last check for 10th guess


  if (guess<randomnumber){
    print ("Higher")
    
  }
  #checking if guess is higher than random number
  if (guess>randomnumber) {
    
    
    print ("lower")
    
  }
  #checking if guess equals random number
  if (guess==randomnumber){
    
    print("Correct!")
  }



  
 
  
