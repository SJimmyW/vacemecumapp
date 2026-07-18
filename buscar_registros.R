

##############################################################################
###'
###' File: buscar_registros.R
###'
###' Module: Navigation
###' Status: Stable
###'
###' Purpose: Searches records.
###'
###' Description: Searches every column classified as searchable using the
###'   text entered by the user. The function returns every matching
###'   record without deciding which one becomes active.
###'
###' Arguments: tabla: data.frame.
###'            texto: search string.
###'            columnas: searchable columns.
###'
###' Returns: Filtered data.frame.
###'
###' Dependencies: dplyr
###'               stringr
###'
###' Used by: server.R
###'
###' Notes: The function is independent of the user interface and can be
###'   reused in other applications of the Suite.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date: 2026
###'
##############################################################################

  buscar_registros <- function(tabla,
                               texto = NULL,
                               columnas){
    
    if(is.null(texto) || texto == "")
      return(seq_len(nrow(tabla))) #return(tabla)
    
    texto <- stringr::str_to_lower(texto)
  
    filas <- apply( tabla[, columnas, drop = FALSE], 1,
                    function(x){
                      any( stringr::str_detect( 
                        stringr::str_to_lower( paste(x, collapse = " ") ),
                        
                        fixed(texto) ) 
                        ) 
                      } )
  
    which(filas) # tabla[filas,,drop = FALSE]
   }