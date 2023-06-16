library(rvest)
library(tidyverse)
library(mongolite)
url<-'https://hargapangan.id/tabel-harga/pedagang-besar/daerah'
beras<-read_html(url)
beras1<-beras %>% html_nodes("table") %>% html_table()
beras1<-as.data.frame(beras1[[1]])
beras1

#MONGODB
message('Input Data to MongoDB Atlas')
atlas_conn<-mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db = Sys.getenv("ATLAS_DB"),
  url = Sys.getenv("ATLAS_URL")
)
atlas_conn$insert(beras1)
