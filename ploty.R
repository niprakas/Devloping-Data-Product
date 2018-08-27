install.packages("plotly")
library("plotly")
library(reshape)

if(!file.exists("livestock.csv")) {
  download.file("https://data.gov.in/node/88870/datastore/export/csv", destfile = "livestock.csv")
}
popdata <- read.csv("livestock.csv", header = FALSE, sep=",")
poplive <- popdata[-1, ]
poplive
colnames(poplive)<- c("Species", "1951", "1956", "1961", "1966", "1972", "1977", "1982", "1987", "1992", "1997", "2003", "2007")
head(poplive)
mdata <- melt(poplive, id="Species")
mdata
Species <- mdata$Species
Year <- mdata$variable
population <- mdata$value
p <- plot_ly(data = mdata, x = ~Year, y = ~population, color = ~Species, type = "bar") %>% 
  layout(title="Population of livestock", xaxis=list(title="Years"), yaxis=list(title="Population (In Millions)")) 
p
