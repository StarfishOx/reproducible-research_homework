#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

#create random walk function
random_walk  <- function (n_steps) {
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  df[1,] <- c(0,0,1)
  
  for (i in 2:n_steps) {  #initiate a loop to simulate the walk
    
    h <- 0.25  #step size
    
    angle <- runif(1, min = 0, max = 2*pi)  #generate a random angle between 0 & 2*pi
    
    df[i,1] <- df[i-1,1] + cos(angle)*h
    
    df[i,2] <- df[i-1,2] + sin(angle)*h
    
    df[i,3] <- i
    
  }
  
  return(df)
  
}

set.seed(222)  #set a random seed value to make a reproducible simulation
data1 <- random_walk(500)  

#generate a plot using data 1 
plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

set.seed(222)  #set 2nd random seed to the same value to make a reproducible simulation
data2 <- random_walk(500)

#generate a plot using data 2
plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

grid.arrange(plot1, plot2, ncol=2) #show plot1 & 2
