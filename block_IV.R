

##############################################################################
###' Module: Server
###'
###' Block: 4 - Active record
###' Status: Stable
###'
###' Purpose: Retrieves the active record.
###'
###' Description: Builds the active record from the row index resolved by
###'   the navigation layer. This block isolates data retrieval from
###'   navigation and presentation, allowing future migration from Excel
###'   or Google Sheets to database management systems such as Supabase,
###'   PostgreSQL or SQL Server by modifying only the data access function.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date: 2026
##############################################################################

##############################################################################
#
# Active record
#
##############################################################################

    observe({
      req(rv$indice)
      #req(rv$registro)
      rv$registro <- obtener_registro( tabla  = data$general,
                                       indice = rv$indice  )
      })

    observe({
      req(rv$registro)
     
      rv$contexto <- construir_contexto( tabla      = data$general,
                                         registro   = rv$registro,
                                         estructura = comp$estructura )
      })