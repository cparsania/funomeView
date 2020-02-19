# Module UI
  
#' @title   mod_go_plot_panel_ui and mod_go_plot_panel_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_go_plot_panel
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_go_plot_panel_ui <- function(id){
  ns <- NS(id)
  tagList(
  
    shinydashboardPlus::boxPlus(width = NULL,status = "primary",title = "GO plot",
                                footer = "GO plot footer" , 
                                solidHeader = T, 
                                collapsible = T, 
                                closable = F,
                                
                                fluidRow(
                                  ## select GO plot type
                                  column(
                                    width = 2, 
                                    shinyWidgets::pickerInput(inputId = ns("go_plot_types") ,label = "Plot type" ,
                                                              choices = c("CNET plot" ,"EMAP plot" ,"Heat plot" , "Bar plot" , "Dot plot", "Upset plot") ,
                                                              selected = "Chromosome view")
                                    
                                  ),
                                  
                                  ## go plot
                                  column(
                                    width = 7, 
                                    shiny::plotOutput(outputId = ns("go_plot"),width = "auto")
                                  ),
                                  
                                  ## go plot  settings 
                                  column(width = 3,
                                         mod_plot_settings_ui(ns("go_plot_settings"))
                                  ),
                                  
                                )
    )
  )
}
    
# Module Server
    
#' @rdname mod_go_plot_panel
#' @export
#' @keywords internal
    
mod_go_plot_panel_server <- function(input, output, session){
  ns <- session$ns
  
  output$go_plot<- renderPlot(
    shinipsum::random_ggplot(type="random")  
  )
}
    
## To be copied in the UI
# mod_go_plot_panel_ui("go_plot_panel_ui_1")
    
## To be copied in the server
# callModule(mod_go_plot_panel_server, "go_plot_panel_ui_1")
 
