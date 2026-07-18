

###############################################################################
###' Veterinary Knowledge Suite
###'
###' File: texto_lista.R
###'
###' Module: Utilities
###'
###' Purpose: Converts plain text into an HTML list.
###'
###' Description: Formats multiline text as an unordered HTML list whenever
###'   appropriate. If the text is not a list, it is returned unchanged.
###'
###' Arguments: texto: character string.
###'
###' Returns: Character string containing HTML.
###'
###' Dependencies: stringr
###'
###' Used by: contenido_panel.R
###'
###' Notes: The function standardizes the presentation of lists while
###'   preserving ordinary paragraphs.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################



##############################################################################
###'
###'      in sheets text in row is continuos. Each sentence is separated
###'      by ";" character
###' 
##############################################################################

  texto_lista <- function(x){
    if( is.null(x) || is.na(x) || x == "" ) { return(NULL) 
    }
  
   partes <- str_split( x, ";" )[[1]]
  
    partes <- trimws( partes )
    tags$ul( lapply( partes, tags$li ) ) 
  }  