# Load the titanic_clean.csv from Project-2
data_dir <- "/Users/jeevarehakrishnaraj/Desktop/Springboard/Project 3"
titanic <- read.csv(file.path(data_dir,"titanic_clean.csv"))
library(dplyr)
library(ggplot2)

# 1 - Check the structure of titanic
str(titanic)

#The  passanger with missing information  is excluded from the data
titanic$name <-  gsub("^$", "Missing", titanic$name)
titanic <- subset(titanic,name != 'Missing')

# 2 -Plotting the distribution of sexes within the classes of the ship.
ggplot(titanic, aes(x = pclass, fill =sex)) +
  geom_bar(position = 'dodge')

# 3 -  Estimate the chances of survival from the distribution of sexes within the classes of the ship

ggplot(titanic, aes(x = pclass, fill = sex)) +
  geom_bar(position = 'dodge')+
  facet_grid(".~ survived")

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - Estimate the chances of survival based on your age from the distribution of sexes within the classes of the ship.

ggplot(titanic, aes(x = pclass, y = Age, col = sex)) +
  geom_jitter(size = 3, alpha = 0.5, position = posn.jd) +
  facet_grid(". ~ survived")
