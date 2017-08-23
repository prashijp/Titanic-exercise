---
title: "Titanic"
output: html_document
---
## Titanic exercise
#### Prashaanth Jagannathan

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

#### Load the titanic_clean.csv from Project-2
```{r}
data_dir <- "https://github.com/prashijp/Data-Wrangling-Exercise-2-Dealing-with-missing-values"
titanic <- read.csv(file.path(data_dir,"titanic_clean.csv"))
```

#### 1 - Check the structure of titanic
```{r}
str(titanic)
```

The last passanger had missing information hence it is excluded from the data

```{r}
tail(titanic)
titanic <- titanic[-1310,]
```

Load the required packages
```{r}
library(dplyr)
library(ggplot2)
```

#### 2 - Plotting the distribution of sexes within the classes of the ship.
```{r}
ggplot(titanic, aes(x = pclass, fill =sex)) +
  geom_bar(position = 'dodge')
```

#### 3 - Estimate the chances of survival from the distribution of sexes within the classes of the ship.
```{r}
ggplot(titanic, aes(x = pclass, fill = sex)) +
  geom_bar(position = 'dodge')+
  facet_grid(".~ survived")
```
#### 4 - Define an object for position jitterdodge, to use below
```{r}
posn.jd <- position_jitterdodge(0.5, 0, 0.6)
```
#### 5 - Estimate the chances of survival based on your age from the distribution of sexes within the classes of the ship.
```{r}
ggplot(titanic, aes(x = pclass, y = age, col = sex)) +
  geom_jitter(size = 3, alpha = 0.5, position = posn.jd) +
  facet_grid(". ~ survived")
```

