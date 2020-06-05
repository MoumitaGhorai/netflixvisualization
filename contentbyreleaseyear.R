library(dplyr)
df <- netflix_titles %>%
  group_by(release_year) %>%
  summarise(counts = n())
df

ggplot(df, aes(x = df$release_year, y = counts)) +
  geom_bar(fill = "#ffd700", stat = "identity") +
  labs(x = "Year", y = "Number of movies/TV series released", fill = NULL, title = NULL, tag="Figure 2", vjust= -3) +
  theme_pubclean()
