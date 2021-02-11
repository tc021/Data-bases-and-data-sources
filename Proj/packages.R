packs <- c("rio","dplyr","ggplot2","tidyr","Hmisc","rJava","RJDBC","plyr","lubridate","reshape") 
for(pack in packs){
  if (pack %in% rownames(installed.packages()) == FALSE) {install.packages(pack)}
}

library(rio)
library(dplyr)
library(ggplot2)
library(tidyr)
library(Hmisc)
library(rJava)
library(RJDBC)
library(plyr)
library(lubridate)
library(reshape)
