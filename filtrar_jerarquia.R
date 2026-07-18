

    filtrar_jerarquia <- function(tabla, columnas, input) {
      
      filas <- rep(TRUE, nrow(tabla))
      
      for (columna in columnas) {
        valor <- input[[ columna ]]
        
        if (is.null(valor) || valor == "") # if (!is.null(valor) && valor != "")
          next
          
        coincide <- tabla[[columna]] == valor
        coincide[is.na(coincide)] <- FALSE   
          
        filas <- filas & coincide #filas <- filas & tabla[[columna]] == valor
      }
      
      which(filas)
      }
