

##############################################################################
###'
###' File: valores_disponibles.R
###'
###' Module: Utilities
###'
###' Purpose: Returns the available values for a selector.
###'
###' Description: Computes the unique values that remain available for a
###'   structural level after applying the current hierarchical filters.
###'
###' Arguments: tabla: data.frame.
###'            columna: column whose values will be returned.
###'            filtros: named list containing the active filters.
###'
###' Returns: Character vector.
###'
###' Dependencies: dplyr
###'
###' Used by: actualizar_picker.R
###'
###' Notes: The function never updates user interface components. Its only
###'   responsibility is to return the available values.
###'
###'    tabla + filtros actuales + columna
###'            ↓ 
###'    valores únicos disponibles
###'    
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################

  valores_disponibles <- function(tabla, columna){
  
  tabla |>
    
    dplyr::pull(.data[[columna]]) |>
    
    unique() |>
    
    sort(na.last = TRUE)
  
}