

    paneles_visibles <- function(registro,
                                 columnas){
      
      columnas[ vapply( columnas, function(col){
        
        valor <- registro[[ col ]]
        !(is.na(valor) || valor == "") 
        },
        logical(1)
        )
      ] 
      }