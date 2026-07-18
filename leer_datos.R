

  leer_datos <- function(){
  
  fuente <- Sys.getenv("DATA_SOURCE", "sheets")
  
  if(fuente == "excel"){
    
    file <- file.path(getwd(), "info.xlsx")
    
    return(list(
      general    = readxl::read_excel(file, sheet = "General"),
      dosis      = readxl::read_excel(file, sheet = "Dosis"),
      relaciones = leer_relaciones_excel(file)
    ))
  }
  
  if(fuente == "sheets"){
    
    sheet_id <- Sys.getenv("VADEMECUM_SHEET_ID")
    
    if(sheet_id == "")
      stop("Falta VADEMECUM_SHEET_ID")
    
    googlesheets4::gs4_deauth()
    
    return(list(
      general    = googlesheets4::read_sheet(sheet_id, sheet = "General"),
      dosis      = googlesheets4::read_sheet(sheet_id, sheet = "Dosis"),
      relaciones = leer_relaciones_sheets(sheet_id)
    ))
  }
  
  stop("DATA_SOURCE debe ser 'excel' o 'sheets'")
  }
