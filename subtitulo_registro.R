

    subtitulo_registro <- function(registro,
                                   columnas){
      valores <- list()
      
      for(col in rev(columnas)){
        
        valor <- registro[[col]]
        if(!is.na(valor) && valor != "")
          valores <- c(valores, valor)
        }
      if(length(valores) >= 2)
        
        return(valores[[2]])
      NULL
      }