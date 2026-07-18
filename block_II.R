

##############################################################################
###' Module: Server
###'
###' Block: 2 - Initialization
###' Status: Stable
###'
###' Purpose: Initializes the application.
###'
###' Description: Loads the initial state of every navigation component.
###'   The block executes once when the application starts and delegates
###'   all initialization tasks to helper functions.
###'
###' No application logic is implemented here.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date 2026
##############################################################################

    observeEvent(TRUE, { 
############################################################
##      Hierarchical selectors
############################################################
  
    inicializar_picker(
        tabla        = data$general,
        componentes  = comp,
        session      = session
      )

############################################################
##      Incremental search
############################################################
  
    updateSelectizeInput(
       session,
       inputId  = "busqueda",
       choices  = opciones_busqueda(
         tabla       = data$general,
         componentes = comp ),
       selected = character(0),
       server   = TRUE )
   
############################################################
##      Initial active record
############################################################
  
      indice <- resolver_registro(
        candidatos = seq_len( nrow(data$general) )
        )
      #rv$registro <- resolver_registro( tabla = data$general, input = input, componentes = componentes)
      rv$registro <- obtener_registro( tabla  = data$general,
                                       indice = indice
                                       )
  }, once = TRUE)

    # acá iba output$sidebar_filtros