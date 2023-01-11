##### Metadata #####
# Title: Esquisser workshop
# Description: How to use esquisse package for dataviz
# Author: Silvia Gutiérrez (@espejolento)
# Notes: We'll use the wine data from Miércoles de datos
# Data about package: https://cran.r-project.org/web/packages/esquisse/vignettes/get-started.html
# Where to ask questions about esquisse: https://stackoverflow.com/search?q=esquisse

#----Install packages ----
#install.packages("esquisse")
#install.packages("tidyr")
#install.packages("readr")
#install.packages("ggplot2")
#install.packages("forcats")
#install.packages("tidyverse")

#----Load packages ----
library(esquisse)
library(tidyr)
library(readr)
library(tidyverse)
library(forcats) #more on: https://forcats.tidyverse.org/articles/forcats.html
library(ggplot2)

#cheatsheets: 
# 1) https://bookdown.org/tpemartin/minicourse_ggplot2/img/ggplot2.pdf
# 2) https://www.maths.usyd.edu.au/u/UG/SM/STAT3022/r/current/Misc/data-visualization-2.1.pdf
# 1) https://res.cloudinary.com/dyd911kmh/image/upload/v1666806657/Marketing/Blog/ggplot2_cheat_sheet.pdf

#----Load data ----
wine <- read_csv("wine.csv") #smaller (9 MG instead of 50) version of kaggle file without id, region_1, region_2, and description columns 

#another option to load data:
#wine <- read_csv("https://raw.githubusercontent.com/silviaegt/talleres/master/data_viz/wine.csv")
#More about this data: https://www.kaggle.com/datasets/zynicide/wine-reviews

#----Explore data ----
summary(wine)


#----Visualiza data ----

esquisse::esquisser(wine)


#----Visualize one categorical variable ----
# some notes: why are some variables in blue and others in orange ?
# 1. drag country to X - what are we looking at?
# 2. labs and title -> add text to each parameter, what happens?
# 3. plot options -> flip coordinate 
# 4. appearance -> change theme
# 5. data -> delete australia
# 6. code -> insert code

#now explore price

#----Explore generated code ----
library(ggplot2)

ggplot(wine) +#first we give ggplot our data
  aes(x = forcats::fct_infreq(country)) +#now we establish the variables
    geom_bar(fill = "#112446") +#here we say which type of dataviz we want (geom_bar)
  #labs is the section for all text
  labs(x = "country", y = "number of observations", 
       title = "Number of wine tests by country", subtitle = "Data from kaggle", caption = "link to data") +
  theme_minimal()


#----Visualize one numerical variable ----
# 1. drag price to facet - what are we looking at?
# 2. plot options -> change number of bins
# 3. plot options -> change x axis limit
# 4. do the same for points
# Q - what are the most common wine prices?

#----Visualize two variables ----

# 1. drag country to fill & price to x - what are we looking at?
# remember you know the most common wine prices and points!
# 2. data -> select only wines under 50 US (data) and more than >90 points (plot options)
# 3. appearance -> change color of one variable (US for instance)
#4. drag country to facet

 
# Q - which testers have tasted the most expensive wines?
# Q - which testers gives the worst reviews?

# 1. drag country
#boxplot: https://visualizationcheatsheets.github.io/boxplot.html


#----Customize filtered data ----

wine %>% 
  filter(price < 50 & points > 94) %>% 
  count(country, sort = T)

price_value_eu <- wine %>% 
  filter(price < 50 & points > 94 & country == c("France", "Austria", "Italy"))

esquisse::esquisser(price_value_eu)

#check varieties
