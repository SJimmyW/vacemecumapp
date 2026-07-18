

##############################################################################
###'
###'  parte 1: gets libraries, load file name as a list with
###'   each sheet, 2, (easy peasy to modify), erase the 
###'   second row after been taken for the tipo_columna function,
###'   set theme & style. 
###'  
###'  Purpose :
###'     charge libraries, load the file information and keep en memory,
###'     set theme & style (easy peasy to choose your election).
###'     
###'  Arguments: None
###'
###'  Returns: theme & style, 
###'           file 
###'           
###'  Author: SJWatson
###'   AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5)
##############################################################################

##############################################################################
# Vademecum farmacología
# PARTE 1
# Libraryes
# sheet input
# auxiliars functions
##############################################################################

library(shiny)
cat(1, "\n")
library(bslib)
cat(2, "\n")
library(shinyWidgets)
cat(3, "\n")
library(readxl)
cat(4, "\n")
library(dplyr)
cat(5, "\n")
library(stringr)
library(purrr)
library(tidyr)
library(DT)
library(htmltools)
cat(6, "\n")
##############################################################################
###'        Load helper functions
##############################################################################


source("actualizar_picker.R")
source("buscar_registros.R")
source("columnas_estructura.R")
source("columnas_paneles.R")
source("componentes.R")
source("contenido_panel.R")
source("construir_accordion.R")
source("construir_contexto.R")
source("construir_encabezado.R")
source("construir_recursos.R")
source("filtrar_jerarquia.R")
source("inicializar_picker.R")
source("leer_datos.R")
source("mostrar_relaciones.R")
source("obtener_registro.R")
source("opciones_busqueda.R")
source("paneles_visibles.R")
source("primer_texto.R")
source("resolver_destinos.R")
source("resolver_registro.R")
source("subtitulo_registro.R")
source("texto_lista.R")
source("titulo.R")
source("titulo_registro.R")
source("valores_disponibles.R")


##############################################################################
###'                  file
##############################################################################

  #file <- URL_GOOGLE_SHEETS
  #file <- <- leer_supabase()

 # file <- "C:/Users/GoodGame/Mi unidad/app vademecum/info.xlsx"
 # file <- "K:/Mi unidad/app vademecum/info.xlsx"
 # file <- "C:/Users/jimmy/Mi unidad/app vademecum/info.xlsx" 
 ## file <- file.path(getwd(), "info.xlsx")
cat("===== CARGANDO PARTE_1 =====\n")
  file <- file.path(getwd(), "info.xlsx") #read_excel("info.xlsx")
  
  data <- list(
    general = read_excel( file, sheet = "General" ),
    dosis = read_excel( file, sheet = "Dosis" ),
    relaciones = read_excel( file, sheet = "Relaciones" ) )
  cat(file, "\n")
##############################################################################
###'         Normalice. Erase all spaces and leaves a clean text
##############################################################################
  
  data <- lapply( data,
                  function(tabla){
                    tabla |>
                      mutate(
                        across( where(is.character),
                                str_squish ) ) 
                    } )
  
##############################################################################
###'                  types of columns
##############################################################################
  
  #tipo_columna <- as.character( unlist( data$general[ 2,] ) )
  metadatos <-  list(  #data.frame(
    
    tipo = as.character(unlist(data$general[1, ])), # primer fila después de colnames
    
    titulo = as.character(unlist(data$general[2, ])), # 2da fila luego de colnames
    
    nombre = names(data$general),
    
    stringsAsFactors = FALSE
    )
  
  titulos <- stats::setNames(
    metadatos$titulo,
    metadatos$nombre )
  
  comp <- componentes(metadatos)
  data$general <- data$general[ -c(1:2) , ] 
 
  # actualizar_picker
  # columnas_estructura
  # columnas_paneles
  # contenido_panel 
  # primer_texto
  # texto_lista
  # titulo

 
##############################################################################
###'                  Theme and style 
##############################################################################
  
  tema <-
    bs_theme( version = 5,
              bootswatch = "flatly",
              primary = "#2C7FB8",
              secondary = "#6C757D" )

  estilos <- tags$style(HTML(" .accordion-button{ 
  font-weight:600; 
  } .card{ 
  margin-bottom:12px; 
  } .sidebar{
  border-right:1px solid #dcdcdc; 
  } " ) )
  
  
  cat("Tema existe:", exists("tema"), "\n")
  cat("Estilos existe:", exists("estilos"), "\n")