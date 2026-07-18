

##############################################################################
###' File: actualizar_picker.R
###'
###' Module: Navigation
###' Status: Stable
###'
###' Purpose: Updates a hierarchical selector.
###'
###' Description: Updates the available choices of a pickerInput according
###'   to the current hierarchical state of the application. The function
###'   delegates the computation of available values to valores_disponibles().
###'
###' Arguments: inputId: pickerInput identifier.
###'            columna: structural column represented by the picker.
###'            tabla: data.frame.
###'            filtros: named list containing the active hierarchy.
###'            session: shiny session.
###'
###' Returns: None.
###'
###' Dependencies: shinyWidgets
###'               valores_disponibles()
###'
###' Used by: server.R
###'
###' Notes: This function only updates the user interface. It never filters
###'   the data nor determines the active record.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################


##############################################################################
###' 
###'      refresh a pickerInput. The ones that shows in the main panel
###'      
##############################################################################

  actualizar_picker <- function(columna,
                                tabla,
                                componentes,
                                input,
                                session){
    
    estructura <- componentes$estructura
    posicion <- match(columna, estructura)
    
    if(is.na(posicion) || posicion >= length(estructura))
      return(invisible(NULL))
    
    aplicar_filtros <- function(tabla_base, columnas){
      
      for(col in columnas){
        
        valor <- input[[col]]
        
        if(is.null(valor) || length(valor) == 0 || valor == "")
          next
        
        coincide <- tabla_base[[col]] == valor
        coincide[is.na(coincide)] <- FALSE
        
        tabla_base <- tabla_base[coincide, , drop = FALSE]
      }
      
      tabla_base
    }
    
    for(i in seq(posicion + 1, length(estructura))){
      
      columna_destino <- estructura[[ i ]]
      columnas_previas <- estructura[seq_len(i - 1)]
      
      tabla_filtrada <- aplicar_filtros(tabla_base = tabla,
                                columnas = columnas_previas
                                )
      
      opciones <- valores_disponibles( tabla = tabla_filtrada,
                                       columna = columna_destino
                                       )
      
      seleccion_actual <- input[[columna_destino]]
      
      seleccion <- if(
        !is.null(seleccion_actual) && length(seleccion_actual) == 1 &&
        seleccion_actual %in% opciones
      ){
        seleccion_actual
      } else {
        character(0)
      }
      
      updatePickerInput( session = session,
                         inputId = columna_destino,
                         choices = opciones,
                         selected = seleccion
                         )
    }
    
    invisible(NULL)
  }
  
  # vivaelcote(R)