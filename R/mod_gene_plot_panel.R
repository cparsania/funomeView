# Module UI

#' @title   mod_gene_plot_panel_ui and mod_gene_plot_panel_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_gene_plot_panel
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_gene_plot_panel_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    
    shinydashboardPlus::boxPlus(width = NULL,
                                status = "primary",title = "Gene plot",
                                footer = "Select genes to show or to perform GO analysis.",
                                solidHeader = T,collapsible = T,closable = F,
                                fluidRow(
                                  
                                  ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                  ## User input panel ----
                                  ##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                  column(
                                    
                                    width = 3, 
                                    
                                    shinydashboardPlus::boxPad(color = "gray" ,
                                                               shiny::tags$b(("Upload data")),
                                                               br(),br(),
                                                               ## upload inputs
                                                               shinyWidgets::actionBttn(inputId = ns("upload_file"),
                                                                                        label = "Select",
                                                                                        style = "gradient",
                                                                                        color = "success",
                                                                                        block = T),
                                                               
                                                               br(),br(),
                                                               
                                                               ## select species 
                                                               shinyWidgets::pickerInput(inputId = ns("select_species") , 
                                                                                         label = "Select species" ,
                                                                                         choices = sample(LETTERS , size = 10)),
                                                               
                                                               ## select gene plot type 
                                                               shinyWidgets::pickerInput(inputId = ns("gene_plot_types") ,label = "Plot type" ,choices = c("Genome view" ,"Chromosome view") ,
                                                                                         selected = "Chromosome view"),
                                                               
                                                               ## submit 
                                                               shinyWidgets::actionBttn(inputId = ns("submit"),
                                                                                        label = "Submit",
                                                                                        style = "gradient",
                                                                                        color = "success")
                                                               )
                                    
                                    
                                  ),
                                  
                                  ## gene plot 
                                  column(
                                    width = 6, 
                                    shiny::plotOutput(outputId = ns("funome_plot"),width = "auto") %>% 
                                      shinycssloaders::withSpinner()
                                  ),
                                  
                                  ## gene plot settings 
                                  column(width = 3,
                                         mod_plot_settings_ui(ns("main_plot_settings"))
                                  )
                                  
                                )
                                
    )
    
    
  )
}

# Module Server

#' @rdname mod_gene_plot_panel
#' @export
#' @keywords internal

mod_gene_plot_panel_server <- function(input, output, session){
  ns <- session$ns
  
  output$funome_plot <- renderPlot(
    shinipsum::random_ggplot(type="random")  
  )
  
  
}

## To be copied in the UI
# mod_gene_plot_panel_ui("gene_plot_panel_ui_1")

## To be copied in the server
# callModule(mod_gene_plot_panel_server, "gene_plot_panel_ui_1")

