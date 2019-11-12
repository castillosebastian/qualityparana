source('R/ventas.R')
source('R/organization_data.R')
# header-------------------------------------------------------------- 

header <- dashboardHeader(title = "Quality Limpieza")

# sidebar--------------------------------------------------------------
sidebar <- dashboardSidebar(
  sidebarMenu(width = 250,
              sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                                label = "Search..."),
              menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
              menuItem("Ventas", icon = icon("th"), tabName = "Ventas",
                       menuSubItem("Alta", tabName = "input_data_tab",selected = TRUE),
                       menuSubItem("Consulta", tabName = "browse_data_tab",selected = TRUE))
             
  )
)


# Dashboard -----------------------------------------------------------
dashboardPage(
  header, 
  sidebar,
  dashboardBody(
    #tags$head(includeScript("tracking.js")),
    useShinyjs(),
    #shinyjs::inlineCSS(appCSS),
    tags$head(tags$style(HTML(".shiny-split-layout > div {overflow: visible;}"))),
    tabItems(
      input_data_tab(),
      browse_data_tab()),
    use_bs_tooltip())
)

