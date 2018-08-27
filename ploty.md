Livestock population comparision
========================================================
author: Nikhil Prakash
date: 27th Aug,2018
autosize: true

Livestock in India : Overview
========================================================

Livestock production and agriculture are intrinsically linked to each other, and both crucial for overall food security. Livestock sector is an important livelihood activity for most of the farmers. Marginal, small and semi-medium farmers with average operational holdings of area less than 4 ha own about 87.7% of the livestock of this country. 

The total livestock population consisting of Cattle, Buffalo, Sheep, Goat, pig, Horses & Ponies, Mules, Donkeys, Camels, Mithun and Yak in the country is 529.7 million numbers in 2007. 

Our goal is to plot a graph in which we make a comparision in the livestock over the year to compare the substantial increase in Livestock population. As per 18th Livestock census india has vast resource of livestock and poultry about 65.1 million sheep, 135.1 million goats and about 10.3 million pigs. This plays a vital role in improving the socio-economic conditions of rural masses.


Slide With Code
========================================================


```r
library(plotly)
library(reshape)
if(!file.exists("livestock.csv")) {
  download.file("https://data.gov.in/node/88870/datastore/export/csv", destfile = "livestock.csv")
}
popdata <- read.csv("livestock.csv", header = FALSE, sep=",")
poplive <- popdata[-1, ]
colnames(poplive)<- c("Species", "1951", "1956", "1961", "1966", "1972", "1977", "1982", "1987", "1992", "1997", "2003", "2007")
mdata <- melt(poplive, id="Species")
Species <- mdata$Species
Year <- mdata$variable
population <- mdata$value
```

Slide With Plot
========================================================



```
Error in file(con, "rb") : cannot open the connection
```
