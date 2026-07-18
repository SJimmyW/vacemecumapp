


##############################################################################
###'
###'  Function : columnas_estructura()
###'
###'  Purpose :
###'     Returns jerarquic columns. In excel (or sheets) iedentify as
###'     "estructura".  
###'
###'  Arguments: None
###'
###'  Returns: Character vector.
###'
###'  Author: SJWatson
###'  AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5)
##############################################################################

##############################################################################
###'      
###'      Return jerarquic (a.k.a. "estructura" ) columns
###'      
##############################################################################

metadatos <- list(
  
  tipo = as.character(unlist(data$general[2, ])),
  
  titulo = as.character(unlist(data$general[3, ])),
  
  nombre = names(data$general)
  
)