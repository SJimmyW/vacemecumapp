##############################################################################
###'
###' File: opciones_busqueda.R
###'
###' Module: Navigation
###' Status: Stable
###'
###' Purpose: Builds searchable options.
###'
###' Description: Extracts every unique searchable value from the
###'   knowledge base.
###'
###'   If no search columns are defined, the structural hierarchy is used.
###'
###' Arguments:
###'   tabla: data.frame.
###'   componentes: application components.
###'
###' Returns:
###'   Character vector.
###'
###' Dependencies:
###'   dplyr
###'   tidyr
###'
###' Used by:
###'   Block II (Initialization)
###'
###' Notes:
###'   This function only builds the search index.
###'
###' Author: SJWatson
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
##############################################################################

opciones_busqueda <- function(tabla,
                              componentes){
  
## Temporary fallback until search columns are incorporated  
  #browser()
   columnas <- if ("busqueda" %in% names(componentes))
    
    componentes$busqueda
  else
    componentes$estructura
  
  cat("\n----------------------\n")
  cat("Nombres componentes:\n")
  print(names(componentes))
  
  cat("\nColumnas elegidas:\n")
  print(columnas)
  
  cat("\nColumnas de la tabla:\n")
  print(names(tabla))
  
  cat("----------------------\n")
 # if(length(columnas) == 0) columnas <- componentes$estructura # comp$estructura 
  
  tabla |>
    dplyr::select(dplyr::all_of(columnas)) |>
    tidyr::pivot_longer(dplyr::everything()) |>
    dplyr::pull(value) |>
    unique() |>
    stats::na.omit() |>
    sort()
  
}