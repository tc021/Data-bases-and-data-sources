source("dataPreparation.R")
df_jan2021 <- filter(df_clean, year == 2021 & name_of_the_month == "January")


str(df_jan2021)
t <- max(df_jan2021$VOLUME)

boxplot(x = df_jan2021$VOLUME, horizontal = TRUE)
stats <- boxplot.stats(x = df_jan2021$VOLUME)
#379.71
outliers <- stats$out
as.numeric(outliers)
df_jan2021 %>%
  filter(VOLUME == t)

unique(df_jan2021$weekend)
df_jan2021$VOLUME <- format(df_jan2021$VOLUME, scientific = FALSE)



df_jan2021
describe(df_jan2021)
str(df_jan2021)
df_jan2021 %>%
  ggplot(aes(x=DAY,y=VOLUME,group = 1))+
  geom_point() +
  scale_x_date(date_labels="%d %b",date_breaks ="1 day")+
  geom_line() +
  labs(title = "Count of Volumes over time", subtitle = "Month: Jan", caption = "source:https://www.marketwatch.com/investing/stock/gme/") +
  xlab("Day")+
  ylab("Volumes") +
  annotate("text", label = "Max of volumes in March", x=as.Date("2021-01-19"), y=197157906)
