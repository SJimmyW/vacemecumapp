

##############################################################################
###' Module: Server
###'
###' Block: 6 - Interface synchronization
###' Status: Stable
###'
###' Purpose: Synchronizes user interface components.
###'
###' Description: Keeps navigation controls synchronized after user
###'   interaction. The block contains only interface behavior and never
###'   performs navigation, data retrieval or presentation logic.
###'
###' Author: SJWatson
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date:2026
##############################################################################

##############################################################################
###'               Search -> Hierarchy
##############################################################################

    observeEvent(
  
      rv$registro,
      ignoreNULL = TRUE, {
        
        req(rv$modo == "busqueda")
        for(columna in comp$estructura){
          
          updatePickerInput( session, 
                             inputId = columna,
                             selected = rv$registro[[columna]] )
        }
        }
      )

##############################################################################
###'               Hierarchy -> Search
##############################################################################

    observeEvent(
  
      rv$registro,
      ignoreNULL = TRUE, {
        
        req(rv$modo == "jerarquia")
        updateSelectizeInput( session, 
                              inputId = "busqueda",
                              selected = rv$registro$principio_activo
        )
        }
      )