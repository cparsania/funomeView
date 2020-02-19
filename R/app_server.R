#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  callModule(mod_app_layout_server, "app_layout_ui_1")
}
