## dplyr-intro.r

## install the dplyr pacakage
install.packages("dplyr")
library(dplyr)
install.packages("gapminder")
library(gapminder)

str(gapminder)

## filter()! 
filter(gapminder, lifeExp < 32)
filter(gapminder, country == "Mexico")
filter(gapminder, country %in% c("Mexico","Ecuador"))

## the pipe operator '%>%'
gapminder %>% head()
gapminder %>% head(10)

## dplyr::select()

select(gapminder, year, lifeExp) # this is the same as

gapminder %>% select(year, lifeExp) #... this

## chaining 'gapminder data, then select those colums, then take 4 columns'
gapminder %>% select(year, lifeExp) %>% head(4)

## select a few varuables for Cambodia
gapminder %>% 
    filter(country == "Cambodia") %>% 
    select(-continent, -lifeExp) %>% 
    mutate(gdp = pop * gdpPercap)

## dplyr::mutate()
gapminder %>% 
    mutate(gdp = pop * gdpPercap) # calculate gdp

## calculate mean gdp for Cambodia
gapminder %>% 
    #filter(country == "Cambodia") %>% 
    select(-continent, -lifeExp) %>% 
    mutate(gdp = pop * gdpPercap) %>% 
    group_by(country) %>% 
    summarise(mean_gdp = mean(gdp)) %>% 
    ungroup() # Always ungroup if you group

## Exercise: find maximum life expectency for countries in Asia.
# What is earliest year in this subset

B <- gapminder %>% 
    filter(continent == "Asia") %>% 
    group_by(country) %>% 
    filter(lifeExp == min(lifeExp)) %>% 
    arrange(desc(year)) %>% 
    # summarise(min_lifeExp = max(lifeExp), min_year = min(year) ) %>% 
    # arrange(min_lifeExp) %>% 
    ungroup()
