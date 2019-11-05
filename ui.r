
# input ---------------------------------------------------------------
input_data_tab<-function(){
  tabItem(tabName = "input_data_tab",
  fluidRow(
  box(width=12,title="",
  includeMarkdown("save_data.md"))
  ),
  fluidRow(
  box(width=12,title="",
numericInput(inputId="id_n",label="id_n",value=1, min = NA, max = NA, step = NA)%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="id_fecha",label="id_fecha",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="op_tipo",label="op_tipo",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="activo_tipo",label="activo_tipo",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="activo_código",label="activo_código",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="activo_mercado",label="activo_mercado",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textAreaInput(inputId="at_desc",label="at_desc",placeholder="Change placeholder", width = "1000px", height = "100px")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="at_conclusión",label="at_conclusión",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="at_señal_entrada_esperada",label="at_señal_entrada_esperada",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="agenda_fecha",label="agenda_fecha",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ),
textInput(inputId="agenda_op_tipo",label="agenda_op_tipo",placeholder="Change placeholder")%>%
              shinyInput_label_embed(
                icon("info") %>%
                  bs_embed_tooltip(title = "Change this help text for input")
              ))
  ),fluidRow(
  actionButton("save", "Save")

  )
  )
  }
# browse tab function -------------------------------------------------
browse_data_tab<-function(){
  tabItem(tabName = "browse_data_tab",
  fluidRow(
  box(width=12,title="",
  includeMarkdown("browse_data.md"))
  ),
  fluidRow(
  box(width=12,title="Browse Data",
  withSpinner(DT::dataTableOutput('data')),
  downloadButton("download_data")
  )
  )

  )
  }

# Dashboard -----------------------------------------------------------
dashboardPage(
  dashboardHeader(title = "Quality Limpieza"),
  dashboardSidebar(width = 150, 
                   sidebarMenu(id = "tabs",
                               menuItem("Alta", tabName = "input_data_tab", icon=icon("file-alt")),
                               menuItem("Busqueda",tabName = "browse_data_tab",icon = icon("archive")))),
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

