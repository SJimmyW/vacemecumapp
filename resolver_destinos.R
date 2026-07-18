

##############################################################################
###' File: resolver_destinos.R
###'
###' Module: Relationships
###' Purpose: Resolves records related to the active record.
###'
###' Description: Filters the suite relationship table using the active record
###'   identifier and returns the related destination records when their app
###'   data source is available. This function performs no rendering.
###'
###' Arguments:
###'   relaciones: data.frame with suite relationships.
###'   registro: one-row data.frame representing the active record.
###'   app_actual: character. Name of the current app.
###'   id_columna: character. ID column in the active record.
###'   suite: named list of app data sources.
###'
###' Returns: data.frame with resolved relationship rows.
###' 
###' Author: SJWatson
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date:2026
##############################################################################

  resolver_destinos <- function(relaciones,
                                registro,
                                app_actual,
                                id_columna,
                                suite = list()){
    if(is.null(relaciones) || nrow(relaciones) == 0)
      return(NULL)
    
    if(is.null(registro) || nrow(registro) == 0)
      return(NULL)
  
    id_actual <- as.character(registro[[ id_columna ]][[ 1 ]])
  
    requeridas <- c("origen_app", "origen_id", "destino_app", "destino_id")
    if(!all(requeridas %in% names(relaciones)))
     return(NULL)
  
    salientes <- relaciones[ relaciones$origen_app == app_actual &
                               as.character(relaciones$origen_id) == id_actual,,
                             drop = FALSE ]
  
    entrantes <- relaciones[ relaciones$destino_app == app_actual & 
                               as.character(relaciones$destino_id) == id_actual,
    , drop = FALSE ]
  
    salientes$app_relacionada <- salientes$destino_app
    salientes$id_relacionado <- salientes$destino_id
    salientes$direccion <- "saliente"
  
    entrantes$app_relacionada <- entrantes$origen_app
    entrantes$id_relacionado <- entrantes$origen_id
    entrantes$direccion <- "entrante"
  
    resultado <- dplyr::bind_rows(salientes, entrantes)
    
    if(nrow(resultado) == 0)
     return(NULL)
  
    resultado$titulo_destino <- resultado$id_relacionado
    
    for(i in seq_len(nrow( resultado ))){
    
    app <- resultado$app_relacionada[[ i ]]
    id <- as.character(resultado$id_relacionado[[ i ]])
    
    if(!app %in% names(suite))
      next
    
    fuente <- suite[[ app ]]
    tabla <- fuente$tabla
    id_destino <- fuente$id_columna
    titulo_destino <- fuente$titulo_columna
    
    fila <- tabla[as.character(tabla[[id_destino]]) == id, , drop = FALSE]
    
    if(nrow(fila) == 0)
      next
    
    resultado$titulo_destino[[i]] <- fila[[titulo_destino]][[1]]
    }
    resultado
    }