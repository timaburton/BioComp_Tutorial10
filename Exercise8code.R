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

# create a vector of numbers 1 through 100 for the computer to chose from 
options <- c(1:100)
number <- sample(options, 1)
x = "not correct"
print("I'm thinking of a number 1-100...")
while (x != "correct") {
Guess <- readline(prompt = "Guess: ")
if (substr(Guess, 1, 3) > number){
  print("Lower")
}else if (substr(Guess, 1, 3) < number){
  print("Higher")
}else{
  print("You got it!")
  x = "correct"
}
}

