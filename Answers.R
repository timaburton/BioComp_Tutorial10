##set wd##
setwd("C:/Users/matth/Desktop/Intro_to_Biocomputing/BioComp_Tutorial10")

###problem 1###
#upload table
table <- read.table(file="UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors=FALSE) 
#pre-allocate variables
uwscore <- 0
msuscore <- 0
uwx <- vector(mode="list")
uwy <- vector(mode="list")
msux <- vector(mode="list")
msuy <- vector(mode="list")
#make lists with score over time
for (i in 1:nrow(table)){
  if (table$team[i]=="UW"){
  uwscore <- uwscore + table[i,3]
  uwx <- c(uwx,table[i,1])
  uwy <- c(uwy, uwscore)
  }
  else{
    msuscore <- msuscore+table[i,3]
    msux <- c(msux,table[i,1])
    msuy <- c(msuy, msuscore)
  }
}
#make plots of lists
plot(uwx,uwy,type="l",col="blue",xlab="Time",ylab="Score",)
lines(msux,msuy,type="l",col="green")

###problem 2###
#create number set
numberset <- 1:100
#generate random number
answer <- sample(numberset,1)

#the game itself!#
for (i in 1:10){
  #makes the game 10 rounds long
  if (i<=10){
    guess <- readline(prompt="Guess")
    #if you guess it right, announces that and ends game
    if (guess==answer){
      print("you win!")
      break
    #if you guess low, says higher
    }else if (guess<answer){print("higher")
    #if you guess high, says lower
    }else{print("lower")}
    #if it ends after 10 rounds, make you feel bad
  }else{print("better luck next time :(")}
}
