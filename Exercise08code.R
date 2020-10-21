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

#Plot both cumulative scores against time on 1 plot 
plot(cum$time, cum$cumsum_UW, type="l", col="blue", xlab="Time", ylab="Score")
lines(cum$time, cum$cumsum_MSU, col="red")
legend("topleft",
       c("UW","MSU"),
       fill=c("blue","red")
)

###### Question 2
number <- sample(1:100, 1)
Feedback <- character(length = length(number))
guess <- 50
for(i in 1:length(guess)){
  if(guess[i] > number){ 
    Feedback[i] = "Lower" 
  } else if(guess[i] < number){
    Feedback[i] = "Higher" 
  } else{Feedback[i] = "Correct!"} 
}
Feedback


guess <- 3
guess <- function(g) {
  counter <- 1
  ran <- sample(1:100, 1)
  while(counter < 8) {
    if (g < ran) {
      print(paste0("Too low (No. of attempts: ", counter, ")"))
      m <- readline("Type number again:")
      g <- as.numeric(m)
      counter <- counter + 1
    } else if (g > ran) {
      print(paste0("Too high (No. of attempts: ", counter, ")"))
      m <- readline("Type number again:")
      g <- as.numeric(m)
      counter <- counter + 1
    } else if (g == ran) {
      print("Correct")
      opt <- options(show.error.messages=FALSE)
      on.exit(options(opt))
      stop()
    }
  }
  print(paste0("You've run out of attempts! Correct answer was: ", ran))
}
