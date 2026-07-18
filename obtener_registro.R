##############################################################################
###' File: obtener_registro.R
###'
###' Module: Navigation
###' Status: Stable
###'
###' Purpose: Returns one record.
###'
###' Description: Extracts a single row from the knowledge base using its
###'   numeric index.
###'
###' Arguments:
###'   tabla: data.frame.
###'   indice: row index.
###'
###' Returns:
###'   One-row data.frame or NULL.
###'
###' Dependencies: None.
###'
###' Used by:
###'   Block II
###'
###' Notes:
###'   Separating index resolution from record extraction facilitates future
###'   migration from Excel to SQL databases, where resolving an identifier
###'   and retrieving the corresponding record are naturally different
###'   operations.
###'
###' Author: SJWatson
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###' Date:2026
##############################################################################

    obtener_registro <- function(tabla,
                                 indice){
      if(is.null(indice))
        return(NULL)
      tabla[indice, , drop = FALSE]
      }