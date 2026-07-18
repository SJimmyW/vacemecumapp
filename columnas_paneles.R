


##############################################################################
###' Veterinary Knowledge Suite
###'
###' File: columnas_paneles.R
###'
###' Module: Utilities
###'
###' Purpose: Returns the information panel columns.
###'
###' Description: Identifies every column whose contents must be displayed
###'   as collapsible information panels.
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
###' Notes: The returned order is preserved and determines the order of
###'   appearance of the accordion panels.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################

##############################################################################
###'
###'      returns non estructural columns (a.k.a. "panel"). 
###'              they show up in the side panel
###' 
##############################################################################

  columnas_paneles <- function(){ 
    names(datos$general)[ tipo_columna == "panel" ] 
    }