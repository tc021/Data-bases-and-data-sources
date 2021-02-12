source("dataPreparation.R")
temp <- df_clean %>%
  select(LOW, HIGH,OPEN,CLOSE)

names <- colnames(temp)
#Quartiles
print("From the top, min, Q1, median, Q3, max")
sapply(temp,FUN=fivenum)

#MEAN
print("Mean")
sapply(temp,FUN=mean)




#Quartiles, median, mean visualisation

melted_temp <- melt(temp)
ggplot(melted_temp, aes(x =variable, y= value)) +
  geom_boxplot(outlier.colour = 'red', notch = TRUE) +
  scale_y_log10()+
  coord_flip() +
  stat_summary(fun = mean, geom = "point", shape = 5, size = 3) +
  scale_color_grey() +
  theme_classic() +
  labs(title = "Basic statistics of whole Data", y = "Count", x = "Column")

