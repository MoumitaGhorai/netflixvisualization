

ggplot(df.new, 
       aes(x = df.new$V3, 
           fill = type)) + 
  geom_bar(position = "stack") +
  scale_fill_manual(values = c("#bcbcbc","#ffd700")) +
  labs(y = "Number of Movies/TV shows", 
       fill = "Content type",
       x = "Year") +
  theme_pubclean()

#create summary

library(dplyr)
plotdata <- df.new %>%
  group_by(df.new$V3, df.new$type) %>%
  summarize(n = n()) %>% 
  mutate(pct = n/sum(n),
         lbl = scales::percent(pct))
plotdata

ggplot(plotdata, 
       aes(x = factor(df.new$V3),
           y = pct,
           fill = factor(df.new$type))) + 
  geom_bar(stat = "identity",
           position = "fill") +
  scale_y_continuous(breaks = seq(0, 1, .2), 
                     label = percent) +
  geom_text(aes(label = lbl), 
            size = 3, 
            position = position_stack(vjust = 0.5)) +
  scale_fill_brewer(palette = "Set2") +
  labs(y = "Percent", 
       fill = "Drive Train",
       x = "Class",
       title = "Automobile Drive by Class") +
  theme_minimal()
