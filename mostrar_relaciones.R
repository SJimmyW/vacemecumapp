

##############################################################################
###' File: mostrar_relaciones.R
###'
###' Module: Presentation
###' Purpose: Builds the relationship panel.
###'
###' Description: Receives resolved relationship rows and builds the visible
###'   UI component for the active record. This function never filters data,
###'   never reads the workbook and never resolves destination records.
###'
###' Arguments: relaciones: data.frame returned by resolver_destinos().
###'
###' Returns: htmltools tag or NULL.
###' 
###'  Author: SJWatson
###'   AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5)
##############################################################################

  mostrar_relaciones <- function(relaciones){
  
  if(is.null(relaciones) || nrow(relaciones) == 0)
    return(NULL)
  
  tipos <- unique(relaciones$tipo_relacion)
  
  paneles <- lapply(tipos, function(tipo){
    
    tabla <- relaciones[
      relaciones$tipo_relacion == tipo, , drop = FALSE ]
    
    items <- lapply(seq_len(nrow(tabla)), function(i){
      
      detalle <- c( tabla$app_relacionada[[i]],
                    tabla$rol[[i]],
                    tabla$especie[[i]],
                    tabla$observaciones[[i]] )
      
      detalle <- detalle[!is.na(detalle) & detalle != ""]
      
      tags$li( tags$strong(tabla$titulo_destino[[i]]),
               tags$div( paste(detalle, collapse = " | "),
                         class = "text-muted" ) )
      })
    
    accordion_panel( title = titulo(tipo, titulos),
                     tags$ul(items) )
    })
  
    do.call(accordion, c(list(open = FALSE), paneles))
    }