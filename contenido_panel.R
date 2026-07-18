##############################################################################
###'
###'  Function : contenido_panel()
###'
###'  Purpose :
###'     Returns the names of the information columns defined
###'      as "panel" in the metadata row of the General sheet.
###'
###'   Arguments: None
###'
###'  Returns: Character vector.
###'
###'  Author: SJWatson
###'   AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5)
##############################################################################

##############################################################################
###' 
###'      returns HTML content of a panel
###'          
##############################################################################

  contenido_panel <- function(contexto,
                              columna){
  
    texto <- contexto[[columna]]
    
    if(is.null(texto) || is.na(texto) || texto == "")
      return(NULL)
    
    if(stringr::str_detect(texto, ";"))
      return(texto_lista(texto))
    
    tags$p(texto)
  }