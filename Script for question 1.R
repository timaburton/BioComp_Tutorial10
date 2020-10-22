#Load the dataset to the variable file1
file1<-read.table(file = "UWvMSU_1-22-13.txt", header = TRUE, sep = "")

#Define the output vectors.
cumalativesumUW<-0
cumalativesumMSU<-0
time<-0

# Create empty data frame with columns

output<-data.frame(x=time, y1=cumalativesumUW, y2=cumalativesumMSU)

for(i in 1:nrow(file1)){
  
  if(file1$team[i]=="UW"){
    
    time<-file1$time[i]
    cumalativesumUW<-cumalativesumUW+file1$score[i]
    
    #Create a dataframe with the timepoint for UW as X and the cumalative sum for each timepoint as Y.
    
  }else{
    time<-file1$time[i]
    cumalativesumMSU<-cumalativesumMSU+file1$score[i]
    
    #create temp data frame of the ith row
    temp=data.frame(x=time, y1=cumalativesumUW, y2=cumalativesumMSU)
    # rbind to output and reassign to 
    output=rbind(output, temp)
  }
}

#Print output and plot.
output
plot(x=output$x, y=output$y1, xlab="time", ylab="score", type='l', col="red")
lines(x=output$x, y=output$y2, col="blue")

# Add legend to the plot
 
legend("topleft", legend = c("UW", "MSU"),
       col = c("red", "blue"),
       lty = 1)

                                          
       

