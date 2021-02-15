source("dataPreparation.R")
df2020_stat <- as.data.frame(filter(df_clean, year == 2020))


#Monthly men
df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(mean_of_the_OPEN_price = mean(OPEN, na.rm = TRUE),
            mean_of_the_CLOSE_price = mean(CLOSE, na.rm = TRUE),
            mean_of_the_HIGH_price = mean(HIGH, na.rm = TRUE),
            mean_of_the_LOW_price = mean(LOW, na.rm = TRUE),) -> monthly_2020_mean_summarize
df2020_stat_monthly_mean <- as.data.frame(monthly_2020_summarize)

#Monthly median
df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(meian_dof_the_OPEN_price = median(OPEN, na.rm = TRUE),
                   median_of_the_CLOSE_price = median(CLOSE, na.rm = TRUE),
                   median_of_the_HIGH_price = median(HIGH, na.rm = TRUE),
                   median_of_the_LOW_price = median(LOW, na.rm = TRUE)) -> monthly_2020_median_summarize
df2020_stat_monthly_median <- as.data.frame(monthly_2020_median_summarize)

#monthly variance
df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(var_of_the_OPEN_price = var(OPEN, na.rm = TRUE),
                   var_of_the_CLOSE_price = var(CLOSE, na.rm = TRUE),
                   var_of_the_HIGH_price = var(HIGH, na.rm = TRUE),
                   var_of_the_LOW_price = var(LOW, na.rm = TRUE)) -> monthly_2020_var_summarize
df2020_stat_monthly_var <- as.data.frame(monthly_2020_var_summarize)

#monthly standard deviatiation
df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(std_of_the_OPEN_price = sd(OPEN, na.rm = TRUE),
                   std_of_the_CLOSE_price = sd(CLOSE, na.rm = TRUE),
                   std_of_the_HIGH_price = sd(HIGH, na.rm = TRUE),
                   std_of_the_LOW_price = sd(LOW, na.rm = TRUE)) -> monthly_2020_std_summarize
df2020_stat_monthly_std <- as.data.frame(monthly_2020_std_summarize)

#Skewness over year 2020

df2020_stat %>% 
  select(OPEN) %>%
  unlist() %>%
  fivenum() -> open_quartiles
q_open <- open_quartiles[2:4]

open_skewnes <- ((q_open[3] - q_open[2]) - (q_open[2] - q_open[1])) / (q_open[3] - q_open[1])

df2020_stat %>% 
  select(CLOSE) %>%
  unlist() %>%
  fivenum() -> close_quartiles
q_close  <- close_quartiles[2:4]

close_skewness <- ((q_close[3] - q_close[2]) - (q_close[2] - q_close[1])) / (q_close[3] - q_close[1])

df2020_stat %>% 
  select(LOW) %>%
  unlist() %>%
  fivenum() -> low_quartiles
q_low <- low_quartiles[2:4]

low_skewness <- ((q_low[3] - q_low[2]) - (q_low[2] - q_low[1])) / (q_low[3] - q_low[1])

df2020_stat %>% 
  select(HIGH) %>%
  unlist() %>%
  fivenum() -> high_quartiles
q_high <- high_quartiles[2:4]

high_skewnes <- ((q_high[3] - q_high[2]) - (q_high[2] - q_high[1])) / (q_high[3] - q_high[1])

over_year_skew <- data.frame(open_skewnes, close_skewness, low_skewness, high_skewnes)




df2020_stat_monthly_mean %>%
  mutate(month = factor(month.name[month], levels = month.name)) %>%
  arrange(month) -> df2020_stat_monthly_mean

df2020_stat_monthly_median %>%
  mutate(month = factor(month.name[month], levels = month.name)) %>%
  arrange(month) -> df2020_stat_monthly_median

df2020_stat_monthly_var%>%
  mutate(month = factor(month.name[month], levels = month.name)) %>%
  arrange(month) -> df2020_stat_monthly_var

df2020_stat_monthly_std%>%
  mutate(month = factor(month.name[month], levels = month.name)) %>%
  arrange(month) -> df2020_stat_monthly_std

df2020_stat_monthly_skew%>%
  mutate(month = factor(month.name[month], levels = month.name)) %>%
  arrange(month) -> df2020_stat_monthly_skew

dbWriteTable(jdbcConnection, "monthly_mean_2020", df2020_stat_monthly_mean)
dbWriteTable(jdbcConnection, "monthly_median_2020", df2020_stat_monthly_median)
dbWriteTable(jdbcConnection, "monthly_variance_2020", df2020_stat_monthly_var)
dbWriteTable(jdbcConnection, "monthly_stddeviation_2020", df2020_stat_monthly_std)
dbWriteTable(jdbcConnection, "skewness_2020", over_year_skew)
