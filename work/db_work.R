#DB work see https://www.datacamp.com/community/tutorials/sqlite-in-r

# dbReadTable(conn, "my_datatable")
# dbListTables(conn)
# dbWriteTable(conn, "productos", productos)
# dbReadTable(conn, "productos")

#   overwrite and append are FALSE
# dbWriteTable(conn, "productos", productos, overwrite = T)

# productos_db %>% collect()
# productos_db %>% collect() %>%
#   filter(stringr::str_detect(PRODUCTO, "JABON")) %>% 
#    View()

# dbReadTable(conn, "my_datatable") %>% View()



            