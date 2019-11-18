
# input data------------------------------
imput_ventas_tab <- function(){
  tabItem(tabName = "imput_ventas_tab",
          fluidRow(box(width=12,title="", includeMarkdown("alta_ventas.md"))),
          
          fluidRow(box(width=12, title="Datos Cliente",collapsible = TRUE,
                       column(6, 
                              numericInput(inputId="nro_venta", label="nro_venta", value=1, min = NA, max = NA, step = NA),
                              dateInput("date1", "fecha", value = Sys.Date()),
                              selectInput(inputId = "cuenta", label = "cuenta", choices = c("efectivo", "crédito", "cheque",
                                                                                            "promocion"), selected = "efectivo"),
                              textInput(inputId="comprador_apellido", label="comprador_apellido",placeholder="completar"),
                              textInput(inputId="comprador_nombres", label="comprador_nombres",placeholder="completar")),
                       column(6, 
                              textInput(inputId="nombre_institución", label="nombre_institución",placeholder="completar") %>%
                                shinyInput_label_embed(icon("info") ),
                              textInput(inputId="comprador_domicilio", label="comprador_domicilio",placeholder="completar") %>%
                                shinyInput_label_embed(icon("info") ),
                              textInput(inputId="domicilio_entrega", label="domicilio_entrega",placeholder="completar") %>%
                                shinyInput_label_embed(icon("info") ),
                              numericInput(inputId="teléfono", label="telefono", value=1, min = NA, max = NA, step = NA) %>%
                                shinyInput_label_embed(icon("info") ),
                              textInput(inputId="mail", label="mail",placeholder="completar") %>%
                                shinyInput_label_embed(icon("info") )))),
          
        box(width=12, title= "Detalle de productos", background = "black",
                         column(6, selectInput(inputId = "producto1", label = "Productos", 
                                                choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
                         column(2, numericInput(inputId= "cantidad1", label = "Cantidad", value=0, min = NA, max = NA, step = NA)), 
                         column(2, tags$h5("$"), textOutput( outputId = "precio_compra1"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto2", label = NULL, 
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad2", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra2"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto3", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad3", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra3"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto4", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad4", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra4"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto5", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad5", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra5"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto6", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad6", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra6"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto7", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad7", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra7"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto8", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad8", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra8"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto9", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad9", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra9"))),
        box(width=12, background = "black",
            column(6, selectInput(inputId = "producto10", label = NULL,
                                  choices = productos %>% filter(ACTIVO) %>% .$PRODUCTO, selected = " ")), 
            column(2, numericInput(inputId= "cantidad10", label = NULL, value=0, min = NA, max = NA, step = NA)),
            column(2, textOutput( outputId = "precio_compra10"))),
        
        fluidRow(box(width=12,  title="Total Venta", background = "blue", textOutput( outputId = "total_compra"))),
        
        fluidRow(actionButton("save", "Save")
                   )
          )
}


# browse data -------------------------------------------------
browse_ventas_tab<-function(){
  tabItem(tabName = "browse_ventas_tab",
          fluidRow(
            box(width=12,title="",
                includeMarkdown("busca_ventas.md"))
          ),
          fluidRow(
            box(width=12,title="Browse Data",
                withSpinner(DT::dataTableOutput('data')),
                downloadButton("download_data")
            )
          )
          
  )
}