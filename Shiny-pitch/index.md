---
title       : Shiny App - Interactive Dataset Explorer
subtitle    : My personal course project for "Developing Data Products" class
author      : by 08costan
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
## R includes an awful lot of base datasets...

- As part of Coursera's Data Science Specialization, recall we have been working on "mtcars", "InsectSprays" or "swiss" datasets

- There is a lot more data to explore (104 datasets using data() function)

- Here are the first few of the list:

```r
data()$results[,3][1:10]
```

```
##  [1] "AirPassengers"          "BJsales"               
##  [3] "BJsales.lead (BJsales)" "BOD"                   
##  [5] "CO2"                    "ChickWeight"           
##  [7] "DNase"                  "EuStockMarkets"        
##  [9] "Formaldehyde"           "HairEyeColor"
```

```r
# Using data() without anything specified will let you browse the full dataset list
```

---

## Exploring these datasets takes some time

It takes time to load a dataset, understand its purpose, view the first few observations...


```r
data(CO2)
head(CO2,n=5)
```

```
##   Plant   Type  Treatment conc uptake
## 1   Qn1 Quebec nonchilled   95   16.0
## 2   Qn1 Quebec nonchilled  175   30.4
## 3   Qn1 Quebec nonchilled  250   34.8
## 4   Qn1 Quebec nonchilled  350   37.2
## 5   Qn1 Quebec nonchilled  500   35.3
```

It appears to be necessary to pull out the help page to understand what this dataset is all about:


```r
?CO2
```

---

## Why not a shiny app for a quick browse?

I made a shinyapp for this purpose:

- It is easier to pick a R base dataset

- It is more user-friendly and interactive than a line of code

- You will have direct access to the data + help page of the dataset



Who knows? With more time we could imagine other functions:
- An interactive menu to select variables to plot

- An interactive menu to select explanatory variables and fit linear models

---

## Please have a look!

Please have a look at my course project here:

https://costan08.shinyapps.io/myapp

Source code can be found on my Github repository:

https://github.com/08costan/developing-data-products

Thank you for your attention!
