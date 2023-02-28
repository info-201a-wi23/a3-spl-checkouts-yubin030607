library(ggplot2)
library(dplyr)

df <- read.csv("C:/Users/yuin0/Documents/Github/info 201/a3-spl-checkouts-yubin030607/csv_file/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

year_checkouts <- df[df != "",] %>% 
  group_by(CheckoutYear) %>% 
  summarize(Total_Checkouts = sum(Checkouts, na.rm = TRUE)) %>% 
  top_n(6)

options(scipen = 100)

ggplot(data = year_checkouts) +
  geom_bar(mapping = aes(x = CheckoutYear, y = Total_Checkouts, fill = Total_Checkouts),
           stat = "identity") +
  labs(
    title = "Total Number of checkouts from 2017 to 2021", 
    x = "Checkout Year", 
    y = "Number of Checkouts",
    fill  = "Year")