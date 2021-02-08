library(RJDBC)

jardir <- "~/Dokumenty/jarfiles"
cp <- paste0(jardir,"/",list.files(path = jardir, pattern = ".jar"))
.jinit(classpath <- cp)
jdbcDriver =JDBC("oracle.jdbc.OracleDriver",classPath="/usr/lib/oracle/21/client64/lib/ojdbc8.jar")

jdbcConnection <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@//213.184.8.44:1521/orac", "sypnik", "H20m0721")

testTabe <- dbGetQuery(jdbcConnection,'select * from employees')

testTabe
