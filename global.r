#install.packages("devtools")
#install.packages("tidyverse")
library(shiny)
library(bsplus)
library(shinydashboard)
library(shinycssloaders)
library(shinyjs)
library(tidyverse)
# for server functions
library(dplyr)
library(DT)
library(glue)
library(readr)
library(DBI)
library(dplyr)
library(dbplyr)
library(RSQLite)
library(googlesheets4)
library(googledrive)
conn <- dbConnect(RSQLite::SQLite(),"my-db.sqlite")
datatable="my_datatable"



