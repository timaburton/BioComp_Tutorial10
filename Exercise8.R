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
##check scores
sum(basketball[basketball$team=="UW",]$score)
sum(basketball[basketball$team=="MSU",]$score)
