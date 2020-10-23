# Set working directory
setwd("/Users/platina/Desktop/BioComp_Tutorial10")

# Exercise 1: plotting UW vs. MSU game

# Load data
scores <- read.table("UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors = FALSE)

# Subsetting scores by team
UW_scores <- scores[which(scores$team == "UW"),]
MSU_scores <- scores[which(scores$team == "MSU"),]

# Generate a cumulative score dataframe
UW_cum_score <- data.frame(time = UW_scores$time, cum_score = cumsum(UW_scores$score))
MSU_cum_score <- data.frame(time = MSU_scores$time, cum_score = cumsum(MSU_scores$score))

# Plotting
plot(UW_cum_score$time, UW_cum_score$cum_score, type = "l", xlab = "Time(min)", ylab = "Cumulative Score", col = "blue")
lines(MSU_cum_score$time, MSU_cum_score$cum_score, col = "black")
legend("topleft", legend = c("UW", "MSU"), col = c("blue", "black"), lty = 1, cex = 0.8)

# Exercise 2: guess my number
guess_my_number <- function(guess=0){
  # create a vector of the numbers from 1 to 100 and randomly choose a number
  num_range <- c(1:100)
  number <- sample(num_range, 1)
  is_correct = FALSE
  print("I'm thinking of a number 1-100...")
  # Prompt the user to enter a number
  guess <- readline(prompt = "Guess: ")
  # Game loop
  while(!is_correct){
    # Check if the guess matches the answer
    if(guess < number){
      print("Higher")
      guess <- readline(prompt = "Guess: ")
    } else if(guess > number){
      print("Lower")
      guess <- readline(prompt = "Guess: ")
    } else{
      print("Correct!")
      is_correct = TRUE
    }
  }
}

# Test function:
guess_my_number()