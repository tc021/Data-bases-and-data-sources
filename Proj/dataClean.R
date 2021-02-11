options(digits = 9)
data_2015_to_2016 <- import("Data/GME_stocks_15-16.csv")
data_2016_to_2017 <- import("Data/GME_stocks_16-17.csv")
data_2017_to_2018 <- import("Data/GME_stocks_17-18.csv")
data_2018_to_2019 <- import("Data/GME_stocks_18-19.csv")
data_2019_to_2020 <- import("Data/GME_stocks_19-20.csv")
data_2020_to_2021 <- import("Data/GME_stocks_20-21.csv")


data_2015_to_2016 %>%
  apply(2, function(x) {x <- gsub("\\$", "", x)})  %>%
  apply(2, function(x) {x <- gsub(",","",x)}) %>%
  as.data.frame() %>%
  mutate(Day = Date) %>%
  mutate(Day = as.Date(Date, format = '%m/%d/%Y')) %>%
  relocate(Day) %>% 
  subset(select = -Date) %>%
  mutate_if(is.character, as.numeric) %>%
  group_by(Day) %>% 
  arrange(Day) -> data_2015_to_2016

data_2016_to_2017 %>%
  apply(2, function(x) {x <- gsub("\\$", "", x)})  %>%
  apply(2, function(x) {x <- gsub(",","",x)}) %>%
  as.data.frame() %>%
  mutate(Day = Date) %>%
  mutate(Day = as.Date(Date, format = '%m/%d/%Y')) %>%
  relocate(Day) %>% 
  subset(select = -Date) %>%
  mutate_if(is.character, as.numeric) %>%
  group_by(Day)  %>% 
  arrange(Day) -> data_2016_to_2017

data_2017_to_2018 %>%
  apply(2, function(x) {x <- gsub("\\$", "", x)})  %>%
  apply(2, function(x) {x <- gsub(",","",x)}) %>%
  as.data.frame() %>%
  mutate(Day = Date) %>%
  mutate(Day = as.Date(Date, format = '%m/%d/%Y')) %>%
  relocate(Day) %>% 
  subset(select = -Date) %>%
  mutate_if(is.character, as.numeric) %>%
  group_by(Day)  %>% 
  arrange(Day) -> data_2017_to_2018

data_2018_to_2019 %>%
  apply(2, function(x) {x <- gsub("\\$", "", x)})  %>%
  apply(2, function(x) {x <- gsub(",","",x)}) %>%
  as.data.frame() %>%
  mutate(Day = Date) %>%
  mutate(Day = as.Date(Date, format = '%m/%d/%Y')) %>%
  relocate(Day) %>% 
  subset(select = -Date) %>%
  mutate_if(is.character, as.numeric) %>%
  group_by(Day) %>% 
  arrange(Day) -> data_2018_to_2019

data_2019_to_2020 %>%
  apply(2, function(x) {x <- gsub("\\$", "", x)})  %>%
  apply(2, function(x) {x <- gsub(",","",x)}) %>%
  as.data.frame() %>%
  mutate(Day = Date) %>%
  mutate(Day = as.Date(Date, format = '%m/%d/%Y')) %>%
  relocate(Day) %>% 
  subset(select = -Date) %>%
  mutate_if(is.character, as.numeric) %>%
  group_by(Day)  %>% 
  arrange(Day) -> data_2019_to_2020

data_2020_to_2021 %>%
  apply(2, function(x) {x <- gsub("\\$", "", x)})  %>%
  apply(2, function(x) {x <- gsub(",","",x)}) %>%
  as.data.frame() %>%
  mutate(Day = Date) %>%
  mutate(Day = as.Date(Date, format = '%m/%d/%Y')) %>%
  relocate(Day) %>% 
  subset(select = -Date) %>%
  mutate_if(is.character, as.numeric) %>%
  group_by(Day) %>% 
  arrange(Day) -> data_2020_to_2021


  