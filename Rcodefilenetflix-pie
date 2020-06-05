# Pie chart

library(dplyr)
df <- netflix_titles %>%
  group_by(type) %>%
  summarise(counts = n())
df

ggplot(df, aes(x = df$type, y = counts)) +
  geom_bar(fill = "#0073C2FF", stat = "identity") +
  geom_text(aes(label = counts), vjust = -1) + 
  theme_pubclean()

#pie

data(df)

df1 <- df %>%
       mutate(prop = round(df$counts*100/(sum(df$counts)), 1))
              head(df1, 4)

ggplot(df1, aes(x = "", y = prop, fill = df1$type)) +
  geom_bar(width = 1, stat = "identity", color = "white") + 
  labs(x = NULL, y = NULL, fill = NULL, title = "Content type") +
  geom_text(aes(label = prop), color = "white", vjust = -3)+
  coord_polar("y", start = 0)+
  scale_fill_manual(values = c("#ffd700", "#bcbcbc", "#ffa500", "#254290")) +
  theme_classic() +
  theme(axis.line = element_blank(),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            plot.title = element_text(hjust = 0.5, color = "#666666"))
