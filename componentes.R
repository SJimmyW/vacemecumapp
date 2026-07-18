

##############################################################################
###'
###' Veterinary Knowledge Suite
###'
###' File: componentes.R
###'
###' Module: Utilities
###'
###' Purpose: Groups columns according to their metadata type.
###'
###' Description: Creates a list containing the structural, panel,
###'   searchable, resource and selector columns defined by the metadata.
###'   This object acts as the application's configuration and is used
###'   throughout the server.
###'
###' Arguments: tipo_columna: named character vector describing the type
###'            assigned to every column.
###'
###' Returns: Named list.
###'
###' Dependencies: columnas_estructura()
###'               columnas_paneles()
###'
###' Used by: server.R
###'
###' Notes: The function contains no application logic. It only organizes
###'   metadata into reusable groups.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##################################################################### data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAbElEQVR4Xs2RQQrAMAgEfZgf7W9LAguybljJpR3wEse5JOL3ZObDb4x1loDhHbBOFU6i2Ddnw2KNiXcdAXygJlwE8OFVBHDgKrLgSInN4WMe9iXiqIVsTMjH7z/GhNTEibOxQswcYIWYOR/zAjBJfiXh3jZ6AAAAAElFTkSuQmCC#########

  componentes <- function(metadatos){
  
  split(
    metadatos$nombre,
    metadatos$tipo
  )
  
}
  