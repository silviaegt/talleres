# Introductory workshop on word processing with R
# Author: Silvia Gutiérrez (@espejolento)
# License: CC BY 4.0
# Inspired by the workshop @rivaquiroga: 
#https://github.com/silviaegt/RLadiesCDMX_talleres/blob/master/extraccion_pdfs/importacion-y-limpuerta-textos.R

# BEFORE! Let's create a project to make sure the pdf we want to transform is in the same environment as our code
# File > In this lesson we will use four R packages, if you don't have them installed
# you can install them with the function: install.packages("package-name-in-quotes")

library(pdftools)
library(stringr)
library(readr)
library(tesseract)
library(tidyverse)


#How to cite:

citation("pdftools")

#How to get help
?pdftools


#Explore your pdf
pdf_info("Federal_Refugee_Law.pdf")
law_info <- pdf_info("Federal_Refugee_Law.pdf")

law_info$pages
law_info$keys$Author
law_info$keys$Producer

pdf_fonts("Federal_Refugee_Law.pdf")

# Read the text with the following pdftools function:
law <- pdftools::pdf_text("Federal_Refugee_Law.pdf")
#download from: https://github.com/ColmexBDCV/tricks_for_librarians/blob/master/RCode/pdftools-y-tesseract/Ley_Federal_Refugiados.pdf

#### Explore our created object´
law #we can always see what is in our variable by typing its name and pressing Ctrl+Enter (or from our environment variables)
law[1]
print(law[1])
cat(law[1])


# The function saved each page in different vectors
# to save all the text in the same variable we use the stringr function, str_c() and the "collapse" parameter
law_text <- stringr::str_c(law, collapse = "")
law_text #we can save the collapsed text in a new variable, so you can see the difference

# Save your collapsed text (the one you generated on line 23)
#in a plain text file with the readr function: write_lines()
readr::write_lines(law_text, "law.txt")

# Example 2: Digital native + url + tables

url <- c("http://www.cicad.oas.org/oid/pubs/JamaicaNationalHouseholdDrugSurvey2017ENG.pdf")

############# Example 3: Text/Image (scanned) #################

tesseract::tesseract_download("chi_tra_vert") # the training data of the language we are interested in is downloaded
#in Linux, open your terminal and type:
# sudo apt-get install tesseract-ocr-chi-sim
#see supported languages here: https://tesseract-ocr.github.io/tessdoc/Data-Files-in-different-versions.html
#also: https://github.com/tesseract-ocr/tesseract/issues/1873
#and: https://github.com/tesseract-ocr/tessdata/issues/72
chinese <- pdftools::pdf_ocr_text("Example.pdf", lang="chi_tra_vert") #OCR is applied using the language we downloaded
cat(chinese[1])
readr::write_lines(chinese, "chinese.txt") #with the function write_lines we can create a plain text document with the text extracted with OCR
write(chinese, "chinese2.txt")

############# Example 3: JPG (scanned) #################

tesseract::tesseract_download("ara")
arabic <- tesseract::tesseract("ara")
img  <- "arabic.JPG"
tesseract::ocr(img, arabic) %>% 
  str_split("\n")

