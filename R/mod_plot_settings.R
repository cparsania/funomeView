# Module UI
  
#' @title   mod_plot_settings_ui and mod_plot_settings_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_plot_settings
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_plot_settings_ui <- function(id){
  ns <- NS(id)
  tagList(
    shinydashboardPlus::boxPad(
      color = "gray" ,
      shinydashboardPlus::boxPlus(width = '75%',
                                  title = "Labels and Title",
                                  status = "danger",closable = FALSE,
                                  collapsible = T,
                                  shinyWidgets::sliderTextInput(inputId = ns("plot1_slider1"),
                                                                label = "Slider 1 value 1:", 
                                                                choices = seq(from = 10,to = 1,by = -1),
                                                                grid = TRUE
                                  )  
      ),
      
      shinydashboardPlus::boxPlus(width = '75%',
                                  title  = "Theme and Legend",
                                  status = "danger",
                                  closable = FALSE,
                                  collapsible = T,
                                  collapsed = T,
                                  shinyWidgets::sliderTextInput(inputId = ns("plot1_slider2"),
                                                                label = "Slider 2 value 2:", 
                                                                choices = seq(from = 10,to = 1,by = -1),
                                                                grid = TRUE)
      ),
      shinydashboardPlus::boxPlus(width = '75%',
                                  title  = "Advance option" ,
                                  status = "danger",
                                  closable = FALSE,
                                  collapsible = T,
                                  collapsed = T,
                                  shinyWidgets::pickerInput(inputId = ns("plot1_picker1") ,
                                                            label = "picker1",choices = LETTERS[1:5])
      ),
      
      shinydashboardPlus::boxPlus(width = '75%',
                                  closable= FALSE, 
                                  collapsible = T,
                                  title = "Export" ,
                                  status = "danger",
                                  collapsed = T,
                                  shinyWidgets::pickerInput(inputId = ns("plot1_picker1") ,
                                                            label = "picker1",choices = LETTERS[1:5],
                                  )
      )
      
    )
  )
}
    
# Module Server
    
#' @rdname mod_plot_settings
#' @export
#' @keywords internal
    
mod_plot_settings_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_plot_settings_ui("plot_settings_ui_1")
    
## To be copied in the server
# callModule(mod_plot_settings_server, "plot_settings_ui_1")
 
