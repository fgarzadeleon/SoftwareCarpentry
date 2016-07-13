## swc-data-explorer.r
## Federico Garza de Leon

## read gapminder csv file
gapminder <- read.csv("data/gapminder.csv")
# ---- 
## explore gapminder
head(gapminder) # gives you the header and the first 6 rows

tail(gapminder) # gives you the header and the last 6 rows

str(gapminder) # structure of the data with some sample entries

names(gapminder) # names of the data

ncol(gapminder)

nrow(gapminder)

c() # combines values into the same vector or list

c(nrow(gapminder), ncol(gapminder)) # creat our own dim

summary(gapminder) # summary of all variables

#### explore variables within a dataframe ----
# $ operator to exact or replace parts of an object
head(gapminder$lifeExp)

## Subsetting in R
gapminder[gapminder$lifeExp < 32, c("country","year", "lifeExp")]
gapminder[gapminder$country == 'Uruguay',]

## subsetting in base R with subset()
Panama = subset(gapminder, country == "Panama") # quite self documenting
subset(gapminder, subset = country == "Panama", select = c(country, year,
       lifeExp)) # quite self documenting

plot(Panama$year)
plot(Panama$year, Panama$pop)
dev.print(pdf,"PanamaPop.pdf")

## basic structure of a loop
# for(iterator in set of values){
# do a thing
# }

country_list <- c("Ecuador", "Mexico")
for(country_selected in country_list) {
    country_subset <- subset(gapminder, country == country_selected)
    plot(country_subset$year, country_subset$pop) # plot(x,y)
    dev.print(pdf, paste0(country_selected,"_pop.pdf"))
}

## now make figures for all countries


# for every thing called countr_selected in the country_list, subset, plot,
# and save .pdf
country_list <- unique(gapminder$country)
for(country_selected in country_list) {
    country_subset <- subset(gapminder, country == country_selected)
    plot(country_subset$year, country_subset$pop) # plot(x,y)
    dev.print(pdf, paste0(country_selected,"_pop.pdf"))
}

dir.create("figures")

## calculate mean of each country
country_list <- unique(gapminder$country)

pop_mean_results <- data.frame() # create an empty dataframe
for(i in country_list){
    country_subset <- subset(gapminder,country == i)
    pop_mean <- mean(country_subset$pop)
    print(paste0("the mean population for ",i," is ", pop_mean))
    pop_mean_results = rbind(pop_mean_results, data.frame("Country" = i, "MeanPopulation" = pop_mean))
    }

names(pop_mean_results) <- c("Country", "mean_pop")



