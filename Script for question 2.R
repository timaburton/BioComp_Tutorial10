#make a function to get the input from the user while prompting the charachter "Guess:"


guess<-as.numeric(readline(prompt = "Guess: "))


#The program will guess a number between 1 to 100.
num <- sample(1:100,1)

#define the variable "guess" that will be the user input value which will be compared with "num"


cat("Guess a number between 0 and 100.\n")

#Loop to compare the user input with the random numder (num) gnerated by the program.
count<-0
while(guess != num)
{ 
  guess<-as.numeric(readline(prompt = "Guess: "))
  count<-count+1 #Increase count by one eachtime the loop is executed.
  if (guess == num)
  {
    cat("Correct!\n")
  }
  else if (guess < num)
  {
    cat("Higher\n")
  }
  else if(guess > num)
  {
    cat("Lower\n")
  }
  else if(count > 10) #Run the loop until the count is less than 10.
  {
    cat("Boo")
  }
}
