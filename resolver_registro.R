

##############################################################################
###'
###' Veterinary Knowledge Suite
###'
###' File: resolver_registro.R
###'
###' Module: Navigation
###'
###' Status: Stable
###'
###' Purpose: Resolves the active record.
###'
###' Description: Determines the row index corresponding to the active
###'   record from the current navigation state. The function is
###'   independent of the navigation strategy and may receive candidate
###'   rows generated either by hierarchical exploration or incremental
###'   search.
###'
###' Arguments: candidatos: integer vector containing candidate row
###'            indices.
###'
###' Returns: Integer scalar or NULL.
###'
###' Dependencies: None.
###'
###' Used by: server.R
###'
###' Notes: The function returns only the row index, never the record
###'   itself. Keeping navigation independent of the underlying data
###'   source simplifies future migration from Excel or Google Sheets to
###'   Supabase, PostgreSQL or other database management systems. Only the
###'   data access layer would require modification.
###'
###' Author: SJWatson
###'
###' AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5).
###'
##############################################################################


    resolver_registro <- function( candidatos ){
       if(length(candidatos) == 0)
         return(NULL)
       candidatos[ 1 ]
       }