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
                                  
                                  column(
                                    
                                    width = 3, 
                                    
                                    shinydashboardPlus::boxPad( color = "gray",
                                                                
                                                                ## ontology type 
                                                                shinyWidgets::pickerInput(inputId = ns("go_ontology_types") ,label = "Ontology type" ,
                                                                                          choices = c("Biological Process" ,"Cellular Component" ,"Molecular Function") ,
                                                                                          selected = "Biological Process"),
                                                                
                                                                ## maximum number of genes in the background 
                                                                shiny::numericInput(inputId = ns("minimum_genes_assigned_to_go") , label = "# of minimum genes in a GO term" , value = 10,step = 1,min = 10,max = 500),
                                                                
                                                                ## maximum number of genes in the background 
                                                                shiny::numericInput(inputId = ns("maximum_genes_assigned_to_go") , label = "# of maximum genes in a GO term" , value = 500,step = 1,min = 10,max = 500),
                                                                
                                                                ## p.adjust method 
                                                                shinyWidgets::pickerInput(inputId = ns("go_p_adjust_method") , label = "P.adjust" , 
                                                                                          choices = c("holm" ,"hochberg" ,"hommel" ,"bonferroni" ,"BH" ,"BY", "fdr" ,"none")),
                                                                
                                                                ## select GO plot type
                                                                shinyWidgets::pickerInput(inputId = ns("go_plot_types") ,label = "Plot type" ,
                                                                                          choices = c("CNET plot" ,"EMAP plot" ,"Heat plot" , "Bar plot" , "Dot plot", "Upset plot") ,
                                                                                          selected = "Chromosome view"),
                                                                
                                                                ## submit go analysis 
                                                                #column(width = 12,
                                                                 #      align = "center",
                                                                       shinyWidgets::actionBttn(inputId = ns("submit_go_analysis") ,label = "Submit",style = "gradient" , color = "success")  
                                                                #)
                                    )
                                  ),
                                  ## go plot
                                  column(
                                    width = 6, 
                                    shiny::plotOutput(outputId = ns("go_plot"),width = "auto") %>% shinycssloaders::withSpinner()
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

