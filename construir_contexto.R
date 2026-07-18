

##############################################################################
###'
###' File: construir_contexto.R
###'
###' Purpose:
###' Builds the complete information context associated with the active node.
###'
##############################################################################

    construir_contexto <- function(tabla,
                                   registro,
                                   estructura){
  
      contexto <- list()
  
      for(i in seq_along(estructura)){
        
        niveles <- estructura[ seq_len(i) ]
        
        filas <- rep(TRUE, nrow(tabla))
    
    for(col in niveles){
      
      valor <- registro[[ col ]]
      
      if(is.na(valor) || valor == "")
        break
      
      coincide <- tabla[[ col ]] == valor
      coincide[is.na(coincide)] <- FALSE
      # aca saue la s
      filas <- filas & coincide #filas <- filas & tabla[[ col ]] == valor
      
     # for(nombre in names(fila)){  valor <- fila[[nombre]][1]; if(is.na(valor) || valor == ""); next
        #if(is.null(contexto[[nombre]]));  contexto[[nombre]] <- valor
      }
    
      indice <- which(filas)[ 1 ]
      if(is.na( indice )) 
        next
     
      contexto[[ niveles[i] ]] <-  list(
        registro = tabla[indice,,drop=FALSE] )#tabla[ indice,,drop=FALSE ]
      
      }
      cat("\nNivel:", niveles[i], "\n")
      cat("Indice encontrado:", indice, "\n")
      print(tabla[indice, estructura, drop = FALSE])
    contexto
    }