# New Daily Cases
# Daniel Weinstein
# June 11, 2021

install.packages("zoo")
library(zoo)
?rollmean

state.of.interest = "New Jersey"

dat = covid %>%
  filter(state == "New Jersey") %>%
  group_by(county) %>%
  mutate(newCases = cases - lag(cases)) %>%
  ungroup() %>%
  filter(date == max(date))

covid %>%
  filter(state == state.of.interest) %>%
  group_by(county) %>%
  summarise(cases = sum(cases)) %>%
  mutate(newCases = cases - lag(cases),
  ungroup() %>%
        roll7 = rollmean(newCases, 7, fill = NA, align ="right")) %>%
  ggplot(aes(x = date)) +
  geom_col(aes(y = newCases), col = NA, fill = #F5B8B5) +
  geom_line(aes(y = roll7), col = "blue", size = 1.1 ) +
  ggthemes::theme_wsj() +
  labs(title = paste("7 Day rolling cases,", state.of.interest)) +
  theme(plot.background = element.rect(fill = "gray"),
        panel.background = element.rect(fill = "white"),
        plot.title = element_text(size = 12, face = 'bold')) +
  theme(aspect.ratio = .5)

