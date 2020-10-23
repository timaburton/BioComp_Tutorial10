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
plot(UWx,UWy,type="l", main="UW vs MSU 1-22-13", xlab="Time", ylab="Score", col="red")
lines(MSUx,MSUy)
