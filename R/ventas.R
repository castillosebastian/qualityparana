
# input data------------------------------
input_data_tab <- function(){
  tabItem(tabName = "input_data_tab",
          fluidRow(box(width=12,title="", includeMarkdown("save_data.md"))),
          
          fluidRow(box(width=12, title="",
                       column(6, 
                              numericInput(inputId="nro_venta", label="nro_venta", value=1, min = NA, max = NA, step = NA) %>%
                                shinyInput_label_embed(icon("info") %>% bs_embed_tooltip(title = "Change this help text for input")),
                              dateInput("date1", "fecha", value = Sys.Date()),
                              selectInput(inputId = "cuenta", label = "cuenta", choices = c("efectivo", "crédito", "cheque", "promocion"),
                                   selected = "efectivo")),
                       column(6, 
                              textInput(inputId="comprador_apellido", label="comprador_apellido",placeholder="Change placeholder") %>%
                                shinyInput_label_embed(icon("info") %>% bs_embed_tooltip(title = "Change this help text for input")),
                              textInput(inputId="comprador_nombres", label="comprador_nombres",placeholder="Change placeholder") %>%
                                shinyInput_label_embed(icon("info") %>% bs_embed_tooltip(title = "Change this help text for input")),
                              textInput(inputId="comprador_domicilio", label="comprador_domicilio",placeholder="Change placeholder") %>%
                                shinyInput_label_embed(icon("info") %>% bs_embed_tooltip(title = "Change this help text for input")),
                              textInput(inputId="domicilio_entrega", label="domicilio_entrega",placeholder="Change placeholder") %>%
                                shinyInput_label_embed(icon("info") %>% bs_embed_tooltip(title = "Change this help text for input")),
                              numericInput(inputId="teléfono", label="telefono", value=1, min = NA, max = NA, step = NA) %>%
                                shinyInput_label_embed(icon("info") %>% bs_embed_tooltip(title = "Change this help text for input")),
                              textInput(inputId="mail", label="mail",placeholder="Change placeholder") %>%
                                shinyInput_label_embed(icon("info") %>% bs_embed_tooltip(title = "Change this help text for input"))))),
                       
                   fluidRow(box(width=12,title="",      
                      selectInput(inputId = "osType", label = "Productos", choices = productos_db %>% collect() %>% .$PRODUCTO,
                                   selected = ""), 
                       textInput(inputId="op_tipo",label="op_tipo",placeholder="Change placeholder") %>% 
                         shinyInput_label_embed(icon("info") %>% 
                                                  bs_embed_tooltip(title = "Change this help text for input")),
                       textInput(inputId="activo_tipo",label="activo_tipo",placeholder="Change placeholder") %>%
                         shinyInput_label_embed(icon("info") %>%
                                                  bs_embed_tooltip(title = "Change this help text for input")),
                       textInput(inputId="activo_código",label="activo_código",placeholder="Change placeholder") %>%
                         shinyInput_label_embed(icon("info") %>% 
                                                  bs_embed_tooltip(title = "Change this help text for input")),
                       textInput(inputId="activo_mercado",label="activo_mercado",placeholder="Change placeholder") %>%
                         shinyInput_label_embed(icon("info") %>%
                                                  bs_embed_tooltip(title = "Change this help text for input")),
                       textAreaInput(inputId="at_desc",label="at_desc", 
                                     placeholder="Change placeholder", width = "1000px", height = "100px") %>%
                         shinyInput_label_embed(icon("info") %>%
                                                  bs_embed_tooltip(title = "Change this help text for input")),
                       textInput(inputId="at_conclusión",label="at_conclusión",placeholder="Change placeholder") %>%
                         shinyInput_label_embed(icon("info") %>%
                                                  bs_embed_tooltip(title = "Change this help text for input") ),
                       textInput(inputId="at_señal_entrada_esperada",label="at_señal_entrada_esperada",
                                 placeholder="Change placeholder")%>%
                         shinyInput_label_embed(icon("info") %>%
                                                  bs_embed_tooltip(title = "Change this help text for input")),
                       textInput(inputId="agenda_fecha",label="agenda_fecha",placeholder="Change placeholder") %>%
                         shinyInput_label_embed(icon("info") %>%
                                                  bs_embed_tooltip(title = "Change this help text for input")),
                       textInput(inputId="agenda_op_tipo",label="agenda_op_tipo",placeholder="Change placeholder")%>%
                         shinyInput_label_embed(icon("info") %>%
                                                  bs_embed_tooltip(title = "Change this help text for input")))),
          fluidRow(actionButton("save", "Save")
                   )
          )
}


# browse data -------------------------------------------------
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