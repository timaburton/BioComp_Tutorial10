#Challenge 1


#load file
setwd("/Users/savannahmiracle/Desktop/BioComp_Tutorial10")
scores=read.table("UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors=FALSE)

#separate stats by team
UWscores <- subset(scores,team=="UW")
MSUscores <- subset(scores, team=="MSU")

#create vectors to store times for each team
UWx <- UWscores[,1]
MSUx <- MSUscores[,1]

#create vectors for unadded scores
UWunadded <- UWscores[,3]
MSUunadded <- MSUscores[,3]

#create empty vectors for cumulative scores to go in
UWy <- numeric(length(UWunadded))
MSUy <- numeric(length(MSUunadded))

#loop to calculate and add cumulative scores to vectors
for (i in 1:length(UWunadded)){
  UWy[i]=sum(UWunadded[1:i])
}
for (i in 1:length(MSUunadded)){
  MSUy[i]=sum(MSUunadded[1:i])
}

#plot scores in line graph
plot(UWx,UWy,type="l", main="UW vs MSU 1-22-13", xlab="Minutes", ylab="Score", col="red")
lines(MSUx,MSUy)


#Challenge 2

#initialize variables and possible numbers
possible <- 1:100
num <- sample(possible, size=1)
guess <- 0
try <- 0

#give player instructions
cat("Guess a number between 1 and 100.\n")

#big loop of gameplay!
while(guess != num)
{ 
  #prompt player to guess, if/else if depending on input
  guess <- readline(prompt = "Guess: ")
  if (guess == num)
  {
    #congrats and resets for new game
    cat("Correct! Guess the new number!\n")
    num <- sample(possible, size=1)
    guess <- 0
    try <- 0
  }
  else if (guess < num)
  {
    #gives feedback, increases try count
    cat("Higher!\n")
    try <- try+1
  }
  else if(guess > num)
  {
    #gives feedback, increases try count
    cat("Lower!\n")
    try <- try+1
  }
  if (try == 10)
  {
    #resets for new game if out of tries
    cat("Out of tries! Guess the new number!\n")
    num <- sample(possible, size=1)
    guess <- 0
    try <- 0
  }
}

