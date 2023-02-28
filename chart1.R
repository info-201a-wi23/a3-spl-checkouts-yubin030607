library("dplyr")
library("ggplot2")

df <- read.csv("C:/Users/yuin0/Documents/Github/info 201/a3-spl-checkouts-yubin030607/csv_file/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

Num_Checkout <- df %>%
  filter(CheckoutYear != 2023)

Usage_checkout <- Num_Checkout %>% 
  group_by(CheckoutYear, UsageClass) %>% 
  summarize(total_checkouts = sum(Checkouts))

ggplot(Usage_checkout) +
  geom_line(aes(x = CheckoutYear, y = total_checkouts, color = UsageClass)) +
  
  labs(
    title = "Number of Checkouts for Usage Class from 2017 and 2022", 
    x = "Checkout Year", 
    y = "Number of Checkouts", 
    color = "Type of Usage Class"
  )