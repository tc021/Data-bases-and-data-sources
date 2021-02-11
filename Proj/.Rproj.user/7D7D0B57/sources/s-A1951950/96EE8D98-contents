#data import from csv to Oracle Database
source("ConnectionSetup.R")
source("dataClean.R")


dbWriteTable(jdbcConnection, "stocks_2015_2016", data_2015_to_2016, row.names = TRUE, overwrite = TRUE)
dbWriteTable(jdbcConnection, "stocks_2016_2017", data_2016_to_2017, row.names = TRUE, overwrite = TRUE)
dbWriteTable(jdbcConnection, "stocks_2017_2018", data_2017_to_2018, row.names = TRUE, overwrite = TRUE)
dbWriteTable(jdbcConnection, "stocks_2018_2019", data_2018_to_2019, row.names = TRUE, overwrite = TRUE)
dbWriteTable(jdbcConnection, "stocks_2019_2020", data_2019_to_2020, row.names = TRUE, overwrite = TRUE)
dbWriteTable(jdbcConnection, "stocks_2020_2021", data_2020_to_2021, row.names = TRUE, overwrite = TRUE)
