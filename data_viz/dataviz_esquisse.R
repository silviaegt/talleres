##### Metadata #####
# Title: Esquisser workshop
# Description: How to use esquisse package for dataviz
# Author: Silvia Gutiérrez (@espejolento)
# Notes: We'll use the wine data from Miércoles de datos

#----Install packages ----
#install.packages("esquisse")
#install.packages("tidyr")
#install.packages("readr")
#install.packages("ggplot2")
#install.packages("forcats")
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
wine <- read_csv("wine.csv") #smaller (16.3 MG instead of 50) version of kaggle file without id, region_1, region_2, & description columns & only top 10 countries by data lines
#wine <- read_csv("https://raw.githubusercontent.com/rubyhsing/kaggle_files/main/winemag-data-130k-v2.csv")
#More about this data: https://www.kaggle.com/datasets/zynicide/wine-reviews

#----Explore data ----
summary(wine)


#----Visualiza data ----

esquisse::esquisser(wine)


#----Visualize one variable ----
# some notes: why are some variables in blue and others in orange ?
# 1. drag country to facet - what are we looking at?
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

#----Visualize two variables ----

# 1. drag country to fill & price to x - what are we looking at?
# 2. data -> select only wines under 200 USD
# 3. appearance -> change color of one variable (US for instance)
# 5. data -> delete australia
# 6. code -> insert code
#boxplot: https://visualizationcheatsheets.github.io/boxplot.html


#----Customize filtered data ----

price_by_country <- wine %>% 
  group_by(country) %>% 
  count(price)

esquisse::esquisser(price_by_country)


chile %>%
  filter(puntos > 90 & precio_mxn < 5000) %>%
  ggplot() +
  geom_boxplot(aes(provincia, precio_mxn, fill = provincia)) +
  theme(legend.position = "none") +
  labs(title = "Vinos", subtitle = "Precio y calidad")




esquisser(pirates)
