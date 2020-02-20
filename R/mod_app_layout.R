# Module UI

#' @title   mod_app_layout_ui and mod_app_layout_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_app_layout
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
#' @importFrom  shinydashboardPlus dashboardPagePlus dashboardHeaderPlus  
#' @importFrom shinydashboard dashboardSidebar dashboardBody
#' @importFrom shinyWidgets  actionBttn sliderTextInput dropdownButton
#' @import magrittr
#' @import shinycssloaders
mod_app_layout_ui <- function(id){
  ns <- NS(id)
  tagList(
    shinydashboardPlus::dashboardPagePlus(
      header = shinydashboardPlus::dashboardHeaderPlus(
        enable_rightsidebar = TRUE,
        title = "funomeView",
        rightSidebarIcon = "gears"
      ),
      sidebar = shinydashboard::dashboardSidebar(),
      body = shinydashboard::dashboardBody(
        
        ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        ## info box panel ----
        ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        
        fluidRow(
          shinydashboard::infoBox(title = "Number of Species" , value = sample(90:100,size = 1)),
          shinydashboard::infoBox(title = "Type of Plots",value = sample(90:100,size = 1)),
          shinydashboard::infoBox(title = "last update",value = sample(90:100,size = 1))
        ),
        
        
        ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        ## gene plot panel ----
        ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        mod_gene_plot_panel_ui(id = ns("gene_plot_panel")),
        
        ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        ## GO plot panel ----
        ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        
        mod_go_plot_panel_ui(id = ns("go_plot_panel")),
        
      ),
      footer = shinydashboardPlus::dashboardFooter(),
      rightsidebar = shinydashboardPlus::rightSidebar(),
    )
    
  )
}

# Module Server

#' @rdname mod_app_layout
#' @export
#' @keywords internal

mod_app_layout_server <- function(input, output, session){
  ns <- session$ns
  
  callModule(module = mod_plot_settings_server , id = "main_plot_settings")
  callModule(module = mod_go_plot_panel_server , id = "go_plot_panel")
  callModule(module = mod_gene_plot_panel_server , id = "gene_plot_panel")
  
  
  
}

## To be copied in the UI
# mod_app_layout_ui("app_layout_ui_1")

## To be copied in the server
# callModule(mod_app_layout_server, "app_layout_ui_1")

