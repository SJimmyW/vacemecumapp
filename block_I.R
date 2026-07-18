

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
###'   defines if the user is workin with jerarquía (sequencial) or 
###'   busqueda (search for name)
###'
###' No application logic is implemented here.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date 2026
##############################################################################

##############################################################################
#
# Reactive state
#
##############################################################################

      rv <- reactiveValues(
        
        registro     = NULL,
        modo         = "jerarquia",
        origen       = NULL,
        indice       = NULL,
        actualizando = FALSE
        )
      
      ###' origen : Cuando la propuse estaba pensando en cosas como:
      ###' 
      ###' abrir automáticamente un panel determinado;
      ###' mantener resaltado el camino jerárquico;
      ###' volver al último nivel visitado;
      ###' estadísticas de uso.