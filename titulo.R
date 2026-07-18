

##############################################################################
###'
###' Veterinary Knowledge Suite
###'
###' File: titulo.R
###'
###' Module: Utilities
###'
###' Purpose: Returns the display title of a column.
###'
###' Description: Returns the user-visible title associated with a column
###'    3th row in excel (or sheets). Titles are obtained from the metadata
###'     loaded at application startup. If a title is not available, 
###'     the column name is formatted as a readable label.
###'
###' Arguments: columna: character. Internal column name.
###'            titulos: named character vector containing display titles.
###'
###' Returns: Character string.
###'
###' Dependencies: stringr
###'
###' Used by:
###'   construir_encabezado.R
###'   construir_accordion.R
###'   construir_recursos.R
###'
###' Notes: Falls back to a formatted version of the column name when
###'   no metadata title exists.
###'
###' Author: SJWatson
###'
##############################################################################

  titulo <- function(columna,
                     titulos){
  
  if(columna %in% names( titulos ))
    return( titulos[[ columna ]] )
  
  columna |> stringr::str_replace_all("_"," ") |>
    stringr::str_to_sentence(locale = "es")
  }


##############################################################################
###'
###'  Function : titulo()
###'
###'  Purpose :
###'     compatibility between text and R logic. 
###'     It´s easier create a function that thasform text separated by
###'     "_" character than deal with space.
###'
###'  Arguments: None
###'
###'  Returns: Character vector.
###'
###'  Author: SJWatson
###'  AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5)
##############################################################################

##############################################################################
###' 
###'      transforms sheets names in titles
###'      
##############################################################################

 # titulo <- function(x){ x |> str_replace_all("_"," ") |>  str_to_sentence(locale = "es")  }