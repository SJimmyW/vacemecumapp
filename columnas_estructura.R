

##############################################################################
###'
###' Veterinary Knowledge Suite
###'
###' File: columnas_estructura.R
###'
###' Module: Utilities
###'
###' Purpose: Returns the structural columns.
###'
###' Description: Identifies every column classified as part of the
###'   conceptual hierarchy. The original order is preserved because it
###'   defines the hierarchy of the knowledge structure.
###'
###' Arguments: tipo_columna: named character vector describing the type
###'            assigned to every column.
###'
###' Returns: Character vector.
###'
###' Dependencies: None.
###'
###' Used by: componentes.R
###'
###' Notes: The order of the returned columns must never be modified,
###'   since it represents the conceptual hierarchy.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################


##############################################################################
###'      
###'      Return jerarquic (a.k.a. "estructura" ) columns
###'      
##############################################################################

  columnas_estructura <- function(){
    names(data$general)[ tipo_columna == "estructura" ]
    }