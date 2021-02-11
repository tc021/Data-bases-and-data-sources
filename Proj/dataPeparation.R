source("dataExport.R")

#Quartiles 
df <- rbind(df2015,df2016,df2017,df2018,df2019, df2020)

df %>% 
  mutate(day_of_week = wday(DAY)) %>%
  mutate(month = month(DAY)) %>%
  mutate(year = year(DAY)) -> df_clean
View(df_clean)

week_decode <- data.frame(
  day_of_week = c(1:7),
  name_of_the_day = c("sunday","monday","tuesday","wednesday","thursday","friday","saturday"),
  weekend = c("weekend","workday","workday","workday","workday","workday","weekend")
)

month_decode <- data.frame(
  month = c(1:12),
  name_of_the_month = c("January","February","March","April","May ","June","July","August","September","October","November","December")
)

df_clean <- merge.data.frame(df_clean, week_decode, by = "day_of_week") %>% arrange(DAY)

df_clean <- merge.data.frame(df_clean, month_decode, by = "month") %>% arrange(DAY)
View(df_clean)
