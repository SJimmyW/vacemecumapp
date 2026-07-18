


##############################################################################
###'
###' Veterinary Knowledge Suite
###'
###' File: construir_accordion.R
###' 
###' Module: Presentation
###'
###' Purpose: Builds the information accordion.
###' 
###' Description: builds accordions in the interface to show relevant
###'    & avaible information.
###' 
###' Arguments: registro: wich one
###'            columnas: where it will take the information 
###'            
###' Returns: accordion
###' 
###' Used by: server.R
###' 
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' 
##############################################################################

  construir_accordion <- function(contexto, # registro,
                                  columnas,
                                  titulos){
  
    if(is.null(contexto)) # if(is.null(registro))
    return(NULL)
  
    paneles <- list()

    for(nivel in names(contexto)){
      
      registro <- contexto[[ nivel ]]$registro
      
      columnas_nivel <- columnas[ sapply(columnas,function(x){
        !(is.na(registro[[x]]) || registro[[x]]=="") }) ]#columnas[ purrr::map_lgl( columnas, ~!is.na(registro[[.x]]) && registro[[.x]]!="" ) ]
      
      
      if(length(columnas_nivel) == 0)
        next
      
      contenido <- purrr::map( columnas_nivel, 
                               function(col){
                                 div( tags$strong( titulo(col,titulos) ),
                                      contenido_panel( registro, col ),
                                      tags$hr()) 
                                 }  )
      
      paneles[[ length(paneles) + 1 ]] <- accordion_panel( 
        title = titulo(nivel, titulos),
        tagList(contenido) ) 
      }
    
    if(length(paneles) == 0)
      return(NULL)
    
    do.call( accordion, c( open=FALSE, paneles ) )
    }

  