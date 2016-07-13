## tidyr-intro.r

install.packages("tidyr")
library(tidyr)

## read.csv for wide gapminder data

gap_wide <- read.csv("data/gapminder_wide.csv")
head(gap_wide)
str(gap_wide)

## trying gather() didn't work as expected because did not preserve
gap_long <- gap_wide %>% 
    gather(key = obstype_year, value= obs_value) # obstype_year and obs_value 
                                                # are names of new columns

## trying gather(), preserve country and continent
gap_long <- gap_wide %>% 
    gather(key = obstype_year, value= obs_value, -country, -continent) 
# obstype_year and obs_value 
# are names of new columns

## trying gather(), preserve country and continent
gap_long <- gap_wide %>% 
    gather(key = obstype_year, value= obs_value, -country, -continent) %>% 
    separate(col = obstype_year,
             into = c('obs_type','year'),
             sep = '_') 

gap_normal <- gap_long %>% 
    spread(key = obs_type,
           value = obs_value)
head(gap_normal)