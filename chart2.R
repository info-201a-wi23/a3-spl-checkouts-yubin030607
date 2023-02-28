library("dplyr")
library("ggplot2")

df <- read.csv("C:/Users/yuin0/Documents/Github/info 201/a3-spl-checkouts-yubin030607/csv_file/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

sum_checkouts <- df %>%
  filter(MaterialType %in% c("BOOK", "EBOOK", "AUDIOBOOK"), CheckoutYear != 2023) %>%
  group_by(CheckoutYear, MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts))

ggplot(data = sum_checkouts) +
  geom_line(mapping = aes(x = CheckoutYear,
                          y = total_checkouts,
                          color = MaterialType)) +
  labs(
    title = "Trends of Material Type usage from 2017 to 2022",
    x = "Checkout Year",
    y = "Number of Checkouts",
    color = "Material Type"
  )