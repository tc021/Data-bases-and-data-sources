source("dataPreparation.R")
df2020_stat <- as.data.frame(filter(df_clean, year == 2020))

df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(mean_of_the_OPEN_price = mean(OPEN, na.rm = TRUE),
            mean_of_the_CLOSE_price = mean(CLOSE, na.rm = TRUE),
            mean_of_the_HIGH_price = mean(HIGH, na.rm = TRUE),
            mean_of_the_LOW_price = mean(LOW, na.rm = TRUE),) -> monthly_2020_mean_summarize
df2020_stat_monthly_mean <- as.data.frame(monthly_2020_summarize)

df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(meian_dof_the_OPEN_price = mean(OPEN, na.rm = TRUE),
                   median_of_the_CLOSE_price = mean(CLOSE, na.rm = TRUE),
                   median_of_the_HIGH_price = mean(HIGH, na.rm = TRUE),
                   median_of_the_LOW_price = mean(LOW, na.rm = TRUE)) -> monthly_2020_median_summarize
df2020_stat_monthly_median <- as.data.frame(monthly_2020_median_summarize)

df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(var_of_the_OPEN_price = mean(OPEN, na.rm = TRUE),
                   var_of_the_CLOSE_price = mean(CLOSE, na.rm = TRUE),
                   var_of_the_HIGH_price = mean(HIGH, na.rm = TRUE),
                   var_of_the_LOW_price = mean(LOW, na.rm = TRUE)) -> monthly_2020_var_summarize
df2020_stat_monthly_var <- as.data.frame(monthly_2020_var_summarize)

df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(std_of_the_OPEN_price = mean(OPEN, na.rm = TRUE),
                   std_of_the_CLOSE_price = mean(CLOSE, na.rm = TRUE),
                   std_of_the_HIGH_price = mean(HIGH, na.rm = TRUE),
                   std_of_the_LOW_price = mean(LOW, na.rm = TRUE)) -> monthly_2020_std_summarize
df2020_stat_monthly_std <- as.data.frame(monthly_2020_std_summarize)

df2020_stat %>% 
  group_by(month) %>% 
  dplyr::summarise(skew_of_the_OPEN_price = mean(OPEN, na.rm = TRUE),
                   skew_of_the_CLOSE_price = mean(CLOSE, na.rm = TRUE),
                   skew_of_the_HIGH_price = mean(HIGH, na.rm = TRUE),
                   skew_of_the_LOW_price = mean(LOW, na.rm = TRUE)) -> monthly_2020_skew_summarize
df2020_stat_monthly_skew <- as.data.frame(monthly_2020_skew_summarize)



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
dbWriteTable(jdbcConnection, "monthly_skewness_2020", df2020_stat_monthly_skew)
