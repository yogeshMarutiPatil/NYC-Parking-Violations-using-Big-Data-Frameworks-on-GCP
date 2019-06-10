install.packages("dplyr")
install.packages("stringr")
install.packages("tidyverse")
install.packages("RCurl")
install.packages("RSocrata")
library(RCurl)
library(tidyverse)
library(dplyr)
library(stringr)
library("RSocrata")

#Extraction through API
nyc_parking_2018 <- read.socrata(
  "https://data.cityofnewyork.us/resource/9wgk-ev5c.csv",
  app_token = "LFcYrB7ibeEV1rFOV2evLRPk1",
  email     = "yogeshnxt@gmail.com",
  password  = "Yogi8394"
)

#Extraction through API
violation_code <- read.socrata(
  "https://data.cityofnewyork.us/resource/ncbg-6agr.csv",
  app_token = "LFcYrB7ibeEV1rFOV2evLRPk1",
  email     = "yogeshnxt@gmail.com",
  password  = "Yogi8394"
)





URL <- "https://data.cityofnewyork.us/resource/9wgk-ev5c.csv"
x <- getURL(URL,ssl.verifypeer = FALSE)

setwd("D:/MsDataAnalytics/SEM_2/PDA/PROJECT")
getwd()
nyc_parking_2018 <- read.csv("NYC_DATA_JANUARY.csv",stringsAsFactors = F)
dim(nyc_parking_2018)
na.omit(nyc_parking_2018)
str(nyc_parking_2018)
summary(nyc_parking_2018)
nyc_parking_2018[nyc_parking_2018 == 0] <- NA
nyc_parking_2018 <- na.omit(nyc_parking_2018)
colnames(nyc_parking_2018)[20] <- "Days_Parking_In_Effect"
nyc_parking_2018 <- nyc_parking_2018[!grepl("99", nyc_parking_2018$Registration_State),]
nyc_parking_2018 <- nyc_parking_2018[!grepl("999", nyc_parking_2018$Plate_Type),]
write.csv(nyc_parking_2018, file = "nyc_parking_2018_final.csv",row.names=FALSE)




nyc_parking_2018_Reg = nyc_parking_2018[nyc_parking_2018$Registration_State %in% c("NY", "NJ", "PA", "IN","CT", "FL","MA","ME","IL","VA") ,]
nyc_parking_2018_Reg = nyc_parking_2018_Reg[nyc_parking_2018_Reg$Plate_Type %in% c("PAS", "COM", "OMT", "IRP","OMS", "APP","TRC","SRF","OMR","CMB") ,]
na.omit(nyc_parking_2018_Reg)

nyc_parking_2018_Reg$Registration_State

nyc_parking_2018_Reg$Registration_State = as.factor(nyc_parking_2018_1$Registration_State)
str(nyc_parking_2018_1$Registration_State)
#nyc_parking_2019$Violation.Location
#length(nyc_parking_2019$Summons.Number)
#na.omit(nyc_parking_2019, cols="Violation.Location")

#nyc_parking_2019$Issue.Date <- as.Date(nyc_parking_2019$Issue.Date, "%d/%m/%Y")
#data_date <- nyc_parking_2019[nyc_parking_2019$Issue.Date > "31/12/2017",]
#dim(data_date)
slice_nyc_data <- nyc_parking_2019 %>% slice(1:900000)
dim(sliced_nyc_data)

na_omitted_data<- na.omit(sliced_nyc_data)
summary(na_omitted_data)
new <- na_omitted_data[na_omitted_data$Issue.Date > "2017-12-31",]
new$Issue.Date
str(new)
view(new)
new$Meter.Number

colnames(nyc_parking_2019)<- str_trim(colnames(nyc_parking_2019), side= "both")
colnames(nyc_parking_2019)<- str_replace_all(colnames(nyc_parking_2019), pattern=" ", replacement = "_")
colnames(nyc_parking_2019)<- str_replace_all(colnames(nyc_parking_2019), pattern="\\?", replacement = "")
colnames(nyc_parking_2019)

head(nyc_parking_2019)
dim(nyc_parking_2019)


duplicated(nyc_parking_2019)
nyc_parking_2019<- drop(nyc_parking_2019, "Summons_Number")
dim(nyc_parking_2019)





