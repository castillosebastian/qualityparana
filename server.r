function(input, output, session) {
  dataset_to_save<-reactive({
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
 return(my_data)})

registerData<-observeEvent(input$save,{

  my_dataset<-dataset_to_save()

  withProgress(message="Registering",value=0.2,{
         dbWriteTable(conn, datatable, my_dataset,append=TRUE)
   }) 
 showModal(modalDialog(

  title = "Thank you!",
  "Data has been saved"
  ))
})
allData<-function(){
    my_data<-tbl(conn,datatable)%>%collect()
    shiny::validate(need(nrow(my_data)>0,"no data"))
    return(my_data)
  }
output$data <- DT::renderDataTable({

  data<-allData()

  data<-data%>%select(
  everything()
  )

  DT::datatable(data,  selection = 'single',
  filter='top',
  rownames= FALSE,
  escape=FALSE,
  options = list(
    autoWidth = TRUE,
    scrollX = TRUE, 
    pageLength = 50, 
    columnDefs = list(list(width = '300px', targets = c(6))))
  )
})
output$download_data <- downloadHandler(
  filename = function() {
  paste("download_data", ".csv", sep = "")
  },
  content = function(file) {
  write_csv(allData(), file)})}
