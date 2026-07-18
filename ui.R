

##############################################################################
###'
###'  parte 2:                INTERFACE(UI) 
###'  
###'   Objetive: Build the users interface of Vademécum farmacología.
###'
###'  Main
###'        The interface dosn´t recognice and excel o sheets structura.
###'        Filters and panels will be built in the server, on demand 
###'
###'  Author: SJWatson
###'  AI Collaboration: Developed with assistance from OpenAI ChatGPT (GPT-5.5)
##############################################################################


# Fallback: ensure tema and estilos exist (attempt to source parte_1.R if necessary)
if (!exists("tema") || !exists("estilos")) {
  if (file.exists("parte_1.R")) {
    try(source("parte_1.R"), silent = TRUE)
  }
}
# Default safe values if still missing
if (!exists("tema"))    tema <- NULL
if (!exists("estilos")) estilos <- tags$style(HTML(""))


cat("Tema existe:", exists("tema"), "\n")
cat("Estilos existe:", exists("estilos"), "\n")
cat("===== CARGANDO UI =====\n")
  ui <-
    bslib::page_sidebar(
      title = "Vademécum farmacología",
      theme = tema,
      header = estilos,
      sidebar = bslib::sidebar(
        id = "sidebar",
        width = 320,
        open = TRUE,
        h4("Búsqueda"),
        hr(),
        uiOutput("sidebar_filtros")
      ),
      
      layout_column_wrap(
        width = 1,
        heights_equal = "row",
        card(
          full_screen = TRUE,
          card_header(
            uiOutput("encabezado") ),
          
          card_body(
            uiOutput("accordion_principal")),
          card_body(
            uiOutput("recursos")),
          card_body(
            uiOutput("relaciones"))
        ) ) 
    )
