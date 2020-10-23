#Exercise 8 Assignment
#10/23/2020

#1) Using the score-by-score information from
#this game summarized in “UWvMSU_1-22-13.txt” generate a graph similar to the one I show above. 
#Don’t worry about how pretty your graph is. 
#Focus more on the control structures required in your script used to generate the plot.

#set you current working directory
setwd("~/BioComp_Tutorial10/")

#read in text file off the score of the game as a table.
bballgame = read.table ("~/BioComp_Tutorial10/UWvMSU_1-22-13.txt", header = T, stringsAsFactors = F)
#checking to see if it works
bballgame

#make variables (x,y) that can be plotted (type='1' for line graph)
#variables for the cumulative score that should equal zero (be empty)
UW <- 0
MSU <- 0

#also need two empty matrices to put these scores in 
scoresUW <- matrix(nrow = dim(bballgame)[1], ncol = 2)
scoresMSU <- matrix(nrow = dim(bballgame)[1], ncol = 2)
#create a loop with if-else function for calculating the cumulative
#score after each team scores points and the amount of time that has past.
for (i in 1:dim(bballgame)[1]) {
  if (bballgame[i ,2] == "UW"){
    UW = UW + as.integer(bballgame[2,3])
    scoresUW[i, 1] = bballgame[i, 1]
    scoresUW[i, 2] = UW
    scoresMSU[i, 1] = bballgame[i, 1]
    scoresMSU[i, 2] = MSU
  }else{
    MSU = MSU + as.integer(bballgame[i, 3])
    scoresMSU[i, 1] = bballgame[i, 1]
    scoresMSU[i, 2] = MSU
    scoresUW[i, 1] = bballgame[i, 1]
    scoresUW[i, 2] = UW
  }
}
#check to see if it worked by looking in matrices 
scoresMSU
scoresUW
#also checking cumulative scores
UW
MSU
#MSU WINS by 3!

#plotting the score for UW on a graph
plot(as.numeric(scoresUW[,1]), as.integer(scoresUW[,2]),type = "l")
#plotting score for MSU on a graph
lines(scoresMSU[,1], scoresMSU[,2])


# 2) Write a game called “guess my number”
# The computer will generate a random number between 1 and
#100. The user types in a number and the computer replies “lower” if the random number is lower than the
#guess, “higher” if the random number is higher, and “correct!” if the guess is correct. The player can continue
#guessing up to 10 times.

#first generate random number 1-100
print("I'm thinking of a number 1-100")
randomnumber = sample(1:100)[1]
#need to accept whatever the input is as a guess and then prompt to input guess.
print("Enter Guess")
guess = as.integer(readline())
#player then types out numeric guess

#need to create a loop that can determine whether or not each
#guess is close to the random number produced by the computer.
#Must use "higher" and "lower" as clues and only be used for the first nine guess.
for (i in 1:9) {
  if (guess<randomnumber){
    print("Higher")
    
  }
  else if (guess>randomnumber){
    print("Lower")
  }
  else if(guess == randomnumber){
    print("Correct!")
    break
  }
  print("Enter Guess")
  guess = as.integer(readline())

}

#need to cut off the chain of returning the enter guess option.
#code should be loop that does not include ending
if (guess<randomnumber){
  print ("Higher")
}
if (guess>randomnumber) {
  print ("lower")
}
if (guess==randomnumber){
  print("Correct!")
}
