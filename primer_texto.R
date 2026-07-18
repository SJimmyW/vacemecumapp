

##############################################################################
###' Veterinary Knowledge Suite
###'
###' File: primer_texto.R
###'
###' Module: Utilities
###'
###' Purpose: Returns the first available text.
###'
###' Description: Searches a sequence of values and returns the first
###'   non-empty, non-missing text. Useful when only one description
###'   exists within a hierarchical level.
###'
###' Arguments: x: character vector.
###'
###' Returns: Character string.
###'
###' Dependencies: None.
###'
###' Used by: construir_encabezado.R
###'          contenido_panel.R
###'
###' Notes: Empty strings and missing values are ignored.
###'  registro
###'        ↓
###'  primera celda no vacía
###'       ↓
###'  texto
###'  
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################

##############################################################################
###'
###'      first valid text 
###'      
##############################################################################

  primer_texto <- function(x){
  
   x <- x[ !is.na(x) & x != "" ]
    if(length(x) == 0) return(NULL)
    x[ 1 ]
    } 