# code to plot the cumulative score in respect to time for the data in UWvMSU_1-22-13.txt file

# load the data
scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE)

# find how many times each team scores
UWscores <- scores[scores[,2]=="UW",]
dim(UWscores)
MSUscores <- scores[scores[,2]=="MSU",]
dim(MSUscores)

# set up variables for empty vectors of time and score for each team
timeUW = NULL 
scoreUW = NULL
timeMSU = NULL
scoreMSU = NULL

# set up variable to calculate cumulative score
cumulativeUW = 0
cumulativeMSU = 0

# for loop to separate data by team and place in new data frame 
for (i in 1:length(scores$team)){
  if (scores$team[i]=="UW"){
    cumulativeUW = cumulativeUW + scores$score[i]
    timeUW = append(timeUW, scores$time[i])
    scoreUW = append(scoreUW, cumulativeUW)
  }else{
    cumulativeMSU = cumulativeMSU + scores$score[i]
    timeMSU = append(timeMSU, scores$time[i])
    scoreMSU = append(scoreMSU, cumulativeMSU)
  }
}

# add vectors of time and score for each team to a data frame
dfUW = data.frame(timeUW, scoreUW)
dfMSU = data.frame(timeMSU, scoreMSU)

# plot the data and create appropriate labels
plot(dfUW, type = 'l', xlab = "time", ylab = "score")
lines(dfMSU)

# -----------------------------------------------------------------------

# code for a game called guess my number
# the computer will pick a number 1 through 100 and the suer will try to guess it

# make the game a function so that it can be called easily
GuessGame <- function(number){
  
# create a vector of numbers 1 through 100 for the computer to chose from 
options <- c(1:100)

# use the vector inside the sample function to tell the computer to randomly pick one number
number <- sample(options, 1)

# a variable as not correct so that the while statement will stop when the guess is correct
x = "not correct"

# the prompt of the game
print("I'm thinking of a number 1-100...")

# the while statement keeps the game going until the guesser guesses right
while (x != "correct") {
# promts the user to insert a guess
  Guess <- readline(prompt = "Guess: ")
# tells the user if they need to guess lower or higher or they got it right
if (as.numeric(Guess) > number){
  print("Lower")
}else if (as.numeric(Guess) < number){
  print("Higher")
}else{
  print("You got it!")
  x = "correct"
}
}
}
# call the function to play the game
GuessGame()
