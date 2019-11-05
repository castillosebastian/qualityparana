library(shiny)
library(bsplus)
library(shinydashboard)
library(shinycssloaders)
library(shinyjs)

# for server functions
library(dplyr)
library(DT)
library(glue)
library(readr)
library(DBI)
library(dplyr)
library(dbplyr)
library(RSQLite)
conn <- dbConnect(RSQLite::SQLite(),"my-db.sqlite")
datatable="my_datatable"
