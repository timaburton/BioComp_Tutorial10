##set wd##
setwd("C:/Users/matth/Desktop/Intro_to_Biocomputing/BioComp_Tutorial10")

##problem 1##
table <- read.table(file="UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors=FALSE) 
uwscore <- 0
msuscore <- 0
uwx <- vector(mode="list")
uwy <- vector(mode="list")
msux <- vector(mode="list")
msuy <- vector(mode="list")
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
plot(uwx,uwy,type="l",col="blue",xlab="Time",ylab="Score",)
lines(msux,msuy,type="l",col="green")
