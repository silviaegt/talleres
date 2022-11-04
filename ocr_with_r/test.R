#install.packages("pdftools")
# THe first step
library(pdftools)
library(tidyverse)
library(stringr)
library(readr)

citation("pdftools")
?pdftools

#### Get metadata from pdf ####
law_info <- pdf_info("Federal_Refugee_Law.pdf")
law_info$pages


cat(law_text[3])

#### Convert pdf to text ####
law_text <- pdf_text("Federal_Refugee_Law.pdf")
write(law_text, "law_text.txt")

#### Convert pdf to text part 2 ####

law_text <- stringr::str_c(law_text, colapse ="")
readr::write_lines(law_text, "law_text.txt")

#### OCR an image #####
tesseract_download("ara")
arabic <- tesseract::tesseract("ara")
img  <- "arabic2.JPG"
ocr(img, arabic)

install.packages("magick")
img <- magick::image_read("arabic2.JPG")
arabic_text <- ocr(img, arabic)
cat(arabic_text)

write_lines(arabic_text, "arabic_text.txt")


#### OCR a PDF ####
tesseract_download("chi_tra_vert")
chinese_text <- pdf_ocr_text("chinese_example.pdf", 
                             pages = 1, 
                             lang="chi_tra_vert")

 
#### Reading multiple PDFs ####
library(glue)
library(purrr)
library(magrittr)
library(tidyverse)

# We create a list of years from 2017 to 2019
years<- c(2017:2019)
# We create a list of URLs
urls_cl <- glue("https://www.camara.cl/camara/doc/archivo_historico/mensaje_{years}.pdf")
# List of names for PDFs
pdf_names <-  glue("cl_{years}.pdf")
pdf_names <- c("first.pdf", 
               "second.pdf",
               "third.pdf") 
walk2(urls_cl,
      pdf_names,
      download.file,
      mode="wb")


cl_pdfs <- list.files(path = "./cl_pdfs", 
           pattern ="^cl.*pdf", 
           full.names = T)
cl_pdfs[1:2]

cl_texts <- map(.x = cl_pdfs[1:2], .f=pdf_text)

cl_texts[1]
