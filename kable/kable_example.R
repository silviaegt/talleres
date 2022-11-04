install.packages("kableExtra")
library(kableExtra)
library(tidyverse)
mtcars %>% 
  kable_styling(full_width = F, font_size = 20,
                html_font = "Century Gothic")%>%
  row_spec(0, bold = F, color = "black", background = "#feb24c")%>%
  footnote(general = "Elaborado por RLadiesCDMX.")

kable(mtcars) %>%
  kable_styling("striped", full_width = F) %>%
  row_spec(0, angle = -45)
