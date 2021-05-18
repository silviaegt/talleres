# Análisis y visualización de textos


:calendar: 010 // SCH - Workshop - Wednesday, 09:00am - 10:45am -> [page 48 in pdf program](https://lasaweb.org/uploads/lasa2021-libro-del-programa-final.pdf#page=48)

## 1. Objetivo
Aprende a hacer “lectura distante” (ganar una vista de pájaro sobre muchos textos con herramientas computacionales) con una herramienta que no requiere instalación: Voyant Tools. En este taller usaremos como base el tutorial de Programming Historian en español [Análisis de corpus con Voyant Tools](https://doi.org/10.46430/phes0043) y mostraremos cómo adaptarlo para analizar otro corpus abierto de textos.


## 2. Tallerista

[Silvia Gutiérrez](https://twitter.com/espejolento) estudió la maestría de Humanidades Digitales en la Universidad de Wurzburgo y en el King’s College de Londres. Es co-fundadora de RLadiesCDMX y voluntaria de Wikipedia y Wikidata porque quiere pensar que compartir es el verbo que sustituirá a tener. Durante cinco años trabajó como la primera Bibliotecaria de Humanidades Digitales en El Colegio de México donde impartió diversos talleres sobre el uso de herramientas y la aplicación de métodos computacionales para las Humanidades y Ciencias Sociales. Actualmente está por comenzar su doctorado en la Universidad de Leipzig y el Max Planck para la Historia de la Ciencia.

## 3. Vínculos importantes

### 3.1 Voyant Tools

:wrench: En línea

* Página principal Voyant Tools: [voyant-tools.org](https://voyant-tools.org/)
* [Espejos](https://voyant-tools.org/docs/#!/guide/mirrors) (o sea, sitios que contienen réplicas de algún software o página web)

:computer: Local

* [Descargar la última versión de Voyant Tools Server (M45)](https://github.com/sgsinclair/VoyantServer/releases/tag/2.4.0-M45) (:warning:aunque me ha dado algunos problemas en Windows)
* :white_check_mark: Alternativo: [descargar la versión más estable del Voyant Tools Server (M28)](https://github.com/sgsinclair/VoyantServer/releases/tag/2.4.0-M28)
* Las instrucciones para correr tu propio servidor están [aquí](https://digihum.mcgill.ca/voyant/resources/run-your-own/voyant-server/) (¡ojo! El servidor del blog aparece como "no seguro") | también pueden seguir las instrucciones de [este video](https://www.youtube.com/watch?v=8e7M8NqGyF4)

### 3.2 Corpus

Para esta lección podrás usar:

1. [El programa de LASA2021](https://lasaweb.org/uploads/lasa2021-libro-del-programa-final.pdf)
2. [Una lista de los programas de un track: Literary Studies](https://github.com/silviaegt/talleres/blob/master/voyant/data/lasa2021_litstudies.csv)
3. Una colección de textos que fue "parseada" a partir de una publicación compartida con licencia CC BY 4.0: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4586947.svg)](https://doi.org/10.5281/zenodo.4586947)


### 3.3 Materiales de apoyo

* Este taller está basado en tres fuentes principales:
  * la lección de Programming Historian en español [Análisis de corpus con Voyant Tools](https://doi.org/10.46430/phes0043) existe una breve introducción a cómo preparar un corpus histórico y algunas de las funciones básicas de VT.
  * [Dialogica: Thinking-Through Voyant (DTTV)](https://sgsinclair.github.io/dialogica/) un libro de texto gratuito creado por los desarrolladores de VT para aprender sobre el análisis de texto asistido por computadora con Voyant y Spyral. Las lecciones están vivas, para comentarios escribir a grockwel (arroba) ualberta.ca
  * El libro _Hermeneutica: Computer-Assisted Interpretation in the Humanities_ (MIT Press, 2016), el cual contiene cuatro [capítulos interactivos](http://hermeneuti.ca/) que demuestran las posibilidades de analizar un corpus con la ayuda de VT.
* La [documentación de VT](https://voyant-tools.org/docs/#!/guide/start) es muy útil también para comprender mejor cada una de las herramientas ofrecidas por este software aunque no está tan actualizada

### 3.4 Otras herramientas

* Herramienta para rascado web [Scraper](https://chrome.google.com/webstore/detail/scraper/mbigbapnjcgaffohmbkdlecaccepngjd)

* [Tutorial de Scraper
](uhttps://github.com/ColmexBDCV/talleres/blob/master/Web_Scraping/Extraccion_con_Scraper_y_breve_introduccion_a_XPath.pdf)

* [Tutorial de Web Scraping con Python](https://github.com/ColmexBDCV/talleres/blob/master/Web_Scraping/Tutorial-beautiful-soup-webscrapping.py) por Rodrigo Cuéllar

* [Código para hacer webscrapping de periódicos](https://zenodo.org/record/2587976) por Rodrigo Cuéllar

* [Tutorial de Web Scraping con R](https://github.com/ColmexBDCV/talleres/blob/master/Web_Scraping/Tutorial-beautiful-soup-webscrapping.py) por Silvia Gutiérrez

## Bonus: Un vistazo al entorno de trabajo en Voyant Tools

<img src="https://github.com/programminghistorian/opendataday-2021/blob/main/voyant-tools.png" alt= "el entorno de trabajo en voyant tools"/>
