

##############################################################################
###'
###' Veterinary Knowledge Suite
###'
###' File: construir_encabezado.R
###'
###' Module: Presentation
###'
###' Purpose: Builds the hierarchical header of the selected record.
###'
###' Description: Creates a compact Bootstrap card showing the selected
###'  record and a collapsible section containing the complete hierarchical
###'   path from the most general level to the most specific one.
###'
###'   The function is completely independent of the knowledge domain.
###'
###' Arguments: registro: one-row data.frame.
###'            columnas: structural columns.
###'
###' Returns: htmltools tag.
###'
###' Dependencies: shiny
###'               bslib
###'               titulo()
###'
###' Used by: server.R
###'
###' Notes The hierarchy is built dynamically from the order of the
###'   structural columns.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################

  construir_encabezado <- function(contexto, # registro,
                                   columnas,
                                   titulos){
    
  if(is.null( contexto )) #if(is.null(registro))
    return(NULL)
  
  contexto <- purrr::compact(contexto) # elimina NULL or length-zero empty elements from a list
    
  if(length(contexto) == 0)
      return(NULL)
    
  registro <- contexto[[ length(contexto) ]]$registro
    
    
  titulo_principal <- titulo_registro( registro,    #registro[[ tail( columnas, 1 ) ]]
                                       columnas )
  
  subtitulo <-  subtitulo_registro( registro,
                                    columnas ) #if( length(columnas) >= 2 ) ; registro[[columnas[ length(columnas)-1 ]]]; else ; NULL
  
  contenido <- lapply(columnas, function(col){
    
     valor <- registro[[ col ]] # valor <- rv$contexto[[ col ]]
    
    if(is.na(valor) || valor == "")
      return(NULL)
    
    tags$tr( tags$th( titulo(col, titulos), style="width:35%;" ),
      
      tags$td(valor) )
    
  })
 
  contenido <- purrr::compact(contenido)
  
  card( full_screen = FALSE,
        card_header(
          tags$b(titulo_principal), # tags$strong( titulo_principal ),
          
          if(!is.null( subtitulo ))
            tags$div( subtitulo, class = "text-muted" ) ),
    
    accordion( open = FALSE,
      
      accordion_panel( title = "Ubicación",
                       tags$table( class = "table table-sm", 
                                   tags$tbody(contenido)
                       ) ) ) )
  
  }