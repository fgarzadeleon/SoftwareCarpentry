## toyCarLine.r
## Federico Garza de Leon fgarzadeleon@gmail.com
## plot the cars data as an example

plot(cars)
z <- line(cars)
abline(coef(z), col = "purple")
dev.print(pdf, "toyLinePlot.pdf")



