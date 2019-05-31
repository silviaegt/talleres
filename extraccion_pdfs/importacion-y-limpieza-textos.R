# Taller de introducción al procesamiento de textos con R
# Parte 1: importación y limpieza de archivos, a cargo de @rivaquiroga

library(pdftools)
library(dplyr)
library(stringr)
library(readr)

# leemos el texto
pinera2018 <- pdf_text("textos-chile/2018-06-01_pinera.pdf")
pinera2018

# pdftools tiene funciones como pdf_info, que permiten ver los metadatos del archivo
info <- pdf_info("textos-chile/2018-06-01_pinera.pdf")
# miremos
info # ¿Quién es Jacinto Gorosabel? Busquemos en Google

# La función guardó el texto de cada página en vectores de caracteres distintos. Hay 72 páginas, por lo que tenemos un objeto con 72 cadenas de caracteres distintas. Vamos a juntarlas en una sola:

pinera2018 <- str_c(pinera2018, collapse = "")
pinera2018

# El pdf tiene mucho "ruido" para el análisis. Por ejemplo, tiene un encabezado y números de página. Primero, eliminemos "Presidencia de la República de Chile". 
# Personas utilizando Windows: es posible que el salto de línea aparezca como \r\n
pinera2018 <- str_replace_all(pinera2018, "Presidencia de la\n[:space:]+República de Chile", "")

pinera2018

# Eliminemos ahora los números de página

pinera2018 <- str_replace_all(pinera2018, "\n[:space:]+[:digit:]+\n", "")
pinera2018

# Ahora que quedó solo el texto, podemos guardarlo en un archivo de texto plano. 
write_lines(pinera2018, "pinera_2018.txt")