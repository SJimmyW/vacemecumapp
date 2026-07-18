

    titulo_registro <- function(registro,
                                columnas){
      for(col in rev(columnas)){
        valor <- registro[[col]]
        if(!is.na(valor) && valor != "")
          return(valor)
        }
      NULL
      }