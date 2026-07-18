

##############################################################################
###'
###' File: resolver_registro.R
###'
###' Module: Navigation
###' Status: Stable
###'
###' Purpose: Resolves the active record.
###'
###' Description: Determines the active record of the application from the
###'   current navigation state, regardless of whether the user arrived
###'   through incremental search or hierarchical exploration.
###'
###' Arguments: registros: filtered data.frame.
###'            seleccion: current user selection.
###'
###' Returns: One-row data.frame or NULL.
###'
###' Dependencies: None.
###'
###' Used by: server.R
###'
###' Notes: This function is the only entry point for assigning the active
###'   record displayed by the application. All navigation strategies
###'   converge here.
###'  Navigation
###'        │ 
###'  buscar_registros()
###'  filtrar_jerarquia()
###'  actualizar_picker() 
###'        │
###'  resolver_registro()
###'        │
###'  Presentation
###'  
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date 2026
##############################################################################

  resolver_registro <- function(tabla,
                                seleccion = NULL){
  
  if(nrow(tabla) == 0)
    return(NULL)
  
  if(nrow(tabla) == 1)
    return(tabla)
  
  if(is.null(seleccion))
    return(NULL)
  
  if(!seleccion %in% seq_len(nrow(tabla)))
    return(NULL)
  
  tabla[seleccion,,drop = FALSE]
  }