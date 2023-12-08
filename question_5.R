install.packages("dplyr", "ggplot2")
library(dplyr)
library(ggplot2)

virus_data <- read.csv("question-5-data/Cui_etal2014.csv")  #load data

dimensions <- dim(virus_data)

#get the number of rows and columns
num_rows <- dimensions[1]
num_columns <- dimensions[2]

#show results
cat("Number of rows:", num_rows, "\n")
cat("Number of columns:", num_columns, "\n")


#create a scatter plot of data
ggplot(aes(Virion.volume..nm.nm.nm., Genome.length..kb.), data = virus_data) +  
  
  geom_point() +
  
  xlab("t") +  #label the axes
  
  ylab("y") +
  
  theme_bw()  #black-and-white theme for plot


#log transformations
log_volume <- log(virus_data$Virion.volume..nm.nm.nm.)
log_genome_length <- log(virus_data$Genome.length..kb.)

#print log-transformed values
cat("Log-Transformed Volume:", log_volume, "\n")
cat("Log-Transformed Genome Length:", log_genome_length, "\n")

#fit to linear model
linear_model <- lm(log_volume ~ log_genome_length, data = virus_data)
summary(linear_model)


#write code to reproduce figure
ggplot(aes(log_genome_length, log_volume), data = virus_data) +
  geom_smooth(method = "lm") +
  geom_point() +
  labs(x = "log[Genome length (kb)]", y = "log[Viron volume (nm3)]") +
  theme_bw()


#work out the estimated volume of a 300 kb dsDNA virus
x_value <- 2.477121255  # Define the x-value (log(300))

#get the predicted y-value
predicted_y <- predict(linear_model, newdata = data.frame(log_genome_length = x_value))

#print result
cat("Predicted log_volume when log_genome_length =", x_value, "is", predicted_y, "\n")

#calculate and print volume
viron_volume <- exp(10.8282)
cat("Estimated volume:", viron_volume, "\n")


