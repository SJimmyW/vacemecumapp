

##############################################################################
###'
###' Veterinary Knowledge Suite
###'
###' File: construir_recursos.R
###' 
###' Module: Presentation
###' 
###' Purpose: Builds the resource panel.
###' 
###' Description: 
###' 
###' Arguments:
###' 
###' Returns:
###' 
###' Dependencies:
###' 
###' Used by: server.R
###' 
###' Author: SJWatson
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
##############################################################################

    construir_recursos <- function(contexto, # registro,
                                   columnas, 
                                   titulos){
      if(is.null( contexto )) # if(is.null(registro))
        return(NULL)
      
      contexto <- purrr::compact(contexto)
      
      recursos <- list()
  
      for(nivel in names(contexto)){
        
        registro <- contexto[[ nivel ]]$registro
        
        for(col in columnas){
          
          valor <- registro[[ col ]]
          
          if(is.na(valor) || valor == "")
            next
          
          recursos[[ length(recursos) + 1 ]] <-
            
            card( card_header( titulo(col,titulos) ),
              card_body( tags$p(valor) )
            )
        }
        }
      
      if(length(recursos) == 0)
        return(NULL)
      
      tagList(recursos)
      
    }