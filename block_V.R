

##############################################################################
###' Module: Server
###'
###' Block: 5 - Presentation
###' Status: Stable
###'
###' Purpose: Builds the user interface.
###'
###' Description: Renders every visual component associated with the
###'   active record. All HTML generation is delegated to helper
###'   functions contained in the Presentation module.
###'
###'   The block performs no navigation and no data manipulation.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date: 2026
##############################################################################

    output$encabezado <- renderUI({
      
      req(rv$contexto) # req(rv$registro) #  
      
      construir_encabezado( contexto = rv$contexto, #registro   = rv$registro,
                            #registro = rv$registro,
                            columnas = comp$estructura,
                            titulos  = titulos )
        
      })
    
    output$accordion_principal <- renderUI({
      
      req(rv$contexto) #req(rv$registro) # req(rv$contexto)
      
      construir_accordion( contexto = rv$contexto, #registro   = rv$registro,
                           columnas = comp$panel, #paneles_visibles(  rv$registro, comp$panel ),
                           titulos  = titulos) 
      })
    
    output$recursos <- renderUI({
      
      req(rv$contexto) #req(rv$registro) # req(rv$contexto)
      
      construir_recursos( contexto = rv$contexto, # registro = rv$registro,, 
                          columnas = "recurso", #intersect( "recurso", names(rv$registro) ),
                          titulos  = titulos )
      })
  ## era al fin de block_II  
    output$sidebar_filtros <- renderUI({
      tagList(
        selectizeInput(
          inputId = "busqueda",
          label = "Buscar",
          choices = opciones_busqueda(data$general, comp),
          selected = NULL ),
        
        purrr::map(comp$estructura, function(columna) {
          pickerInput(
            inputId = columna,
            label = titulo(columna, titulos),
            choices = character(0),
            #selected = NULL,
            options = list(`live-search` = TRUE, size = 10) ) 
        })
      )
    })
    
    observe({
      
      req(rv$registro)
      
      cat("\n=========================\n")
      print(names(rv$registro))
      print(rv$registro)
      cat("=========================\n")
      
    })
    
    output$relaciones <- renderUI({
      
      req(rv$registro)
      
      relaciones <- resolver_destinos(
        relaciones = data$relaciones,
        registro   = rv$registro,
        app_actual = "farmacologia",
        id_columna = "principio_activo_id",
        suite      = list( farmacologia = list( tabla = data$general,
                                                id_columna = "principio_activo_id",
                                                titulo_columna = "principio_activo" ) ) )
      
      mostrar_relaciones(relaciones)
    })