library(tidyverse)

setwd("~/Documents/Data")
housing <- read_csv("housing_data.csv")

#create new columns for month and year
housing_tidy <- housing %>%
  separate(`Month of Period End`, into = c("Month", "Year"), convert = TRUE) %>% 
#change values reading (eg) "10K" to "10,000" for manipulation and visualization
  mutate(`Median Sale Price` = case_when(
    str_detect(`Median Sale Price`, "K") ~ as.numeric(str_extract(`Median Sale Price`, "[\\d\\.]+")) * 1000
  ))

head(housing_tidy)

write.csv(housing_tidy, "/Users/akeller/Documents/Data/housing_tidy.csv", row.names = FALSE)
