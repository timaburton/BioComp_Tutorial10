###### Question 1
UWMSU<-read.delim("UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors = FALSE)

#Iterative Cumulative UW Sum
cumsum_UW<-3
for (i in 2:nrow(UWMSU)) {
  if (UWMSU$team[i]=="UW") {
    cumsum_UW[i]<-cumsum_UW[i-1]+UWMSU$score[i]
  } else{
    cumsum_UW[i]<-cumsum_UW[i-1]
  }
  }

#Iterative Cumulative MSU Sum
cumsum_MSU<-0
for (i in 2:nrow(UWMSU)) {
  if (UWMSU$team[i]=="MSU") {
    cumsum_MSU[i]<-cumsum_MSU[i-1]+UWMSU$score[i]
  } else{
    cumsum_MSU[i]<-cumsum_MSU[i-1]
  }
}

#Create a new table so that cumulative scores are linked with game time 
cum<-cbind(UWMSU,cumsum_UW)
cum<-cbind(cum,cumsum_MSU)
cum<-rbind(c(0,"UW",0,0,0), cum)
cum<-rbind(c(0,"MSU",0,0,0), cum)

#Plot both cumulative scores against time on 1 plot 
plot(cum$time, cum$cumsum_UW, type="l", col="blue", xlab="Time", ylab="Score")
lines(cum$time, cum$cumsum_MSU, col="red")
legend("topleft",
       c("UW","MSU"),
       fill=c("blue","red")
)

###### Question 2
#To begin, enter guessnumber() and place your first guess within parentheses. 
#Default guess is 1 if no number is specified.This will be your first guess. 
#Afterwards, guessing can proceed in the console. You will be allowed to 
#guess with feedback 10 total times. 

guessnumber<-function(guess=1){
counter <- 1
number <- sample(1:100, 1)
while(counter < 11) {
  if (guess < number) {
    print(paste0("Higher"))
    counter <- counter + 1
    nextguess <- readline("Guess:")
    guess <- as.numeric(nextguess)
  } else if (guess > number) {
    print(paste0("Lower"))
    counter <- counter + 1
    nextguess <- readline("Guess:")
    guess <- as.numeric(nextguess)
  } else if (guess == number) {
    print("Correct!")
    opt <- options(show.error.messages=FALSE)
    on.exit(options(opt))
    stop()
  } 
}
}

print(paste0("I am thinking of a number 1-100"))
guessnumber()
