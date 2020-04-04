#we will concentrate ourselfs on Measels data
library(tidyverse)
library(dslabs)
data(us_contagious_diseases)

#lets have a glimpse 
glimpse(us_contagious_diseases)
#First we want to calculate the death rate. 
#Some states did not have reported the data consistently if we look at the weeks_reporting variable. 
#So we also adjust the rate accordingly 
dat <- us_contagious_diseases %>%
  filter(year == 1967 & disease=="Measles" & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>% 
  mutate(state = reorder(state, rate))

#To make sure we have a general view of the data back in the days we make a barplot:
  dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()
save.image(file = "Measles.jpeg")  
