source("ConnectionSetup.R")

df2015 <-dbReadTable(jdbcConnection, "stocks_2015_2016")
df2016 <-dbReadTable(jdbcConnection, "stocks_2016_2017")
df2017 <-dbReadTable(jdbcConnection, "stocks_2017_2018")
df2018 <-dbReadTable(jdbcConnection, "stocks_2018_2019")
df2019 <-dbReadTable(jdbcConnection, "stocks_2019_2020")
df2020 <-dbReadTable(jdbcConnection, "stocks_2020_2021")
df2021 <-dbReadTable(jdbcConnection, "stocks_2021")
