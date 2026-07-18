

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

  ui <-
    page_sidebar(
    title = "Vademécum farmacología",
    theme = tema,
    header = estilos,
    sidebar = sidebar(
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
          uiOutput("accordion_principal") ) ) )
    )