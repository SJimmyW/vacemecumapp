

##############################################################################
###' File: inicializar_picker.R
###'
###' Module: Navigation
###' Status: Stable
###'
###' Purpose:
###' Initializes every hierarchical picker.
###'
###' Description: Populates each pickerInput with every available value 
###' found in the corresponding structural column.
###'
###' This function is executed only once during application startup.
###'
###' Unlike actualizar_picker(), this function never reads reactive inputs
###' and therefore can safely be executed outside reactive contexts.
###'
###' Arguments: tabla: Main application table.
###'            componentes: Application components.
###'
###'   session: Shiny session.
###'
###' Returns: None.
###'
###' Dependencies: shinyWidgets
###'               valores_disponibles()
###'
###' Used by:
###'   Block II (Initialization)
###'
###' Notes: This function performs only interface initialization.
###'
###'   Hierarchical filtering is handled later by actualizar_picker().
###'
###' Author: SJWatson
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date: 2026
##############################################################################

    inicializar_picker <- function(tabla,
                                   componentes,
                                   session){
      
      for(columna in componentes$estructura){
        opciones <- valores_disponibles( tabla   = tabla,
                                         columna = columna )
        
        updatePickerInput( session  = session,
                           inputId  = columna,
                           choices  = opciones,
                           selected = character(0) )
        }
      
      invisible(NULL)
      }




