#1
#####plot data on a graph for both teams

##load data
setwd("/Users/benjaminwalter/Desktop/Storage/Biocomputing/BioComp_Tutorial10/BioComp_Tutorial10")
basketball <- read.delim("UWvMSU_1-22-13.txt")
basketball

##create vectors for both teams scores over time
UWscore=c()
UWsum=0
UWtime=c()
MSUscore=c()
MSUsum=0
MSUtime=c()
for(line in 1:nrow(basketball)){
  if(basketball$team[line]=="UW"){
    UWsum=UWsum+basketball$score[line]
    UWscore[line]=UWsum
    UWtime[line]=basketball$time[line]
    MSUscore[line]=MSUsum
    MSUtime[line]=basketball$time[line]
  }else if(basketball$team[line]=="MSU"){
    MSUsum=MSUsum+basketball$score[line]
    MSUscore[line]=MSUsum
    MSUtime[line]=basketball$time[line]
    UWscore[line]=UWsum
    UWtime[line]=basketball$time[line]
  }
}

##plot lines
plot(MSUtime,MSUscore,type="l", main="UW vs. MSU Score throughout Game", xlab="Time(minutes)", ylab="Score", col="green")
lines(UWtime,UWscore, col="red")
##MSU is in green, UW is in red
##check scores
sum(basketball[basketball$team=="UW",]$score)
sum(basketball[basketball$team=="MSU",]$score)
###############################################
#2
##create a random number
random=floor(runif(1,min=0, max=101))
n=0
while(n<10){
  guess <- readline(prompt="Enter your guess: ")
  if(guess==random){
    print("You got it!")
    break
  }else if(guess>random){
    print("Too high, guess again")
    n=n+1
  }else if(guess<random){
    print("Too low, guess again")
    n=n+1
  }
  if(n==10){
    cat("You've used all your attempts- you lose! The number was:", random)
  }
}