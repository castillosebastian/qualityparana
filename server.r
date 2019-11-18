function(input, output, session) {
  dataset_to_save <- reactive({
    my_data <- tibble(
      id_n=input$id_n,
      id_fecha=input$id_fecha,
      op_tipo=input$op_tipo,
      activo_tipo=input$activo_tipo,
      activo_código=input$activo_código,
      activo_mercado=input$activo_mercado,
      at_desc=input$at_desc,
      at_conclusión=input$at_conclusión,
      at_señal_entrada_esperada=input$at_señal_entrada_esperada,
      agenda_fecha=input$agenda_fecha,
      agenda_op_tipo=input$agenda_op_tipo)
 return(my_data) 
    }
 )

registerData<-observeEvent(
  input$save, {
    my_dataset <- dataset_to_save()
    
    withProgress(message="Registering",value=0.2,{dbWriteTable(conn, datatable, my_dataset, append=TRUE)})
  
    showModal(modalDialog(title = "Thank you!","Data has been saved"))
    }
  )

allData<-function(){
    my_data <- tbl(conn, datatable) %>%
      collect()
    
    shiny::validate(need(nrow(my_data)>0,"no data"))
    
    return(my_data)
  }

output$data <- DT::renderDataTable({
  data<-allData()
  data <- data %>%
    select(everything())

  DT::datatable(data,  selection = 'single', filter='top', rownames= FALSE,
                escape=FALSE, options = list(
                  autoWidth = TRUE, scrollX = TRUE, pageLength = 50, 
                  columnDefs = list(list(width = '300px', targets = c(6))))
                )
  })

# ventas output--------------------------------------------------
output$precio_compra1 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto1 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad1})
output$precio_compra2 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto2 & 
                                                             which.max(lista_precios$FECHA_PRECIO)]  * input$cantidad2})
output$precio_compra3 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto3 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad3})
output$precio_compra4 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto4 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad4})
output$precio_compra5 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto5 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad5})
output$precio_compra6 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto6 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad6})
output$precio_compra7 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto7 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad7})
output$precio_compra8 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto8 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad8})
output$precio_compra9 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto9 & 
                                                             which.max(lista_precios$FECHA_PRECIO)] * input$cantidad9})
output$precio_compra10 <- renderText({ lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto10 & 
                                                              which.max(lista_precios$FECHA_PRECIO)] * input$cantidad10})

output$total_compra <- renderText({
  sum(lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto1 & 
                         which.max(lista_precios$FECHA_PRECIO)] * input$cantidad1, 
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto2 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad2,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto3 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad3,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto4 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad4,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto5 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad5,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto6 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad6,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto7 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad7,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto8 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad8,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto9 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad9,
    lista_precios$PRECIO[lista_precios$PRODUCTO == input$producto10 & 
                           which.max(lista_precios$FECHA_PRECIO)] * input$cantidad10, na.rm = T)})
# download----------------------------------------------------------------------------------------o
output$download_data <- downloadHandler(
  filename = function() {
  paste("download_data", ".csv", sep = "")
  },
  content = function(file) {
  write_csv(allData(), file)})}
  