#### Instalar paquetes ####

#install.packages("tokenizers")
#install.packages("rlang")
devtools::install_github("lchiffon/wordcloud2") #A veces te pide bajar RTools

#### Llamar paquetes ####
library(tidyverse)
require(devtools)
library(rvest)
library(wordcloud2)
library(tokenizers)

#### Obtener direccción de trabajo ####
getwd()
#setwd("C:/Users/andy_/Documents/CURSOS_ACTS/R/reto_rladies")

#### Leer lista de URLs con letras de villancicos  ####
#tomados de http://www.navidaddigital.com/villancicos/
#usando https://chrome.google.com/webstore/detail/scraper/mbigbapnjcgaffohmbkdlecaccepngjd?hl=en

villancicos <- read_tsv("villancicos.tsv")
tocollect <- villancicos$URL

#### Obtener letras de las canciones rvest  ####
villancicos_scrape <- lapply(tocollect,
                function(url){
                  url %>% 
                    read_html() %>% 
                    html_nodes(".lyrics") %>% 
                    html_text()
                })


#### Obtener lista de frecuencias  ####
villancicos_freq <- map(villancicos_scrape, tokenize_words) %>% 
  unlist() %>% #Gracias por esto Tere :)
  table()%>% 
  sort(decreasing = T)

#### Cargar lista de palabras vacías  ####
sw <- read_csv("swES.csv")

#### Procesar lista de frecuencias  ####
villancicos_freq <- tibble(palabra = names(villancicos_freq), frecuencia = as.numeric(villancicos_freq))

#### Eliminar stopwords  ####
villancicos_freq <-subset(villancicos_freq, !(palabra %in% sw$swES))

#### Crear wordcloud ####
wordcloud2(villancicos_freq, size = 0.7, shape = 'triangle')
figPath = system.file("examples/xmas.png",package = "wordcloud2")
wordcloud2(villancicos_freq, figPath = figPath, size = 1.5)
# NOTA: Se tiene que dar clic en "show in new window" y abrir en Internet Explorer para poder visualizar
