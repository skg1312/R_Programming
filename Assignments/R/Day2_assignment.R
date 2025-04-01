#1. Load and Print XML and JSON Files
# Load necessary libraries
if (!require("xml2")) install.packages("xml2", dependencies=TRUE)
if (!require("jsonlite")) install.packages("jsonlite", dependencies=TRUE)
if (!require("httr")) install.packages("httr", dependencies=TRUE)
if (!require("ggplot2")) install.packages("ggplot2", dependencies=TRUE)

library(xml2)
library(jsonlite)
library(httr)
library(ggplot2)

# Load and print XML file
xml_file <- "data.xml"
xml_data <- read_xml(xml_file)
cat("XML Data:\n")
print(as_list(xml_data))

# Load and print JSON file
json_file <- "data.json"
json_data <- fromJSON(json_file)
cat("\nJSON Data:\n")
print(json_data)

# Get statistical summary of JSON data if it is a data frame
if (is.data.frame(json_data)) {
  cat("\nStatistical Summary of JSON Data:\n")
  print(summary(json_data))
}

#2 Extract Data from a Website

if (!require("rvest")) install.packages("rvest", dependencies=TRUE)
library(rvest)

# Example: Extract data from Wikipedia page
url <- "https://en.wikipedia.org/wiki/List_of_countries_by_population_(United_Nations)"
webpage <- read_html(url)

# Extract table data
tables <- html_nodes(webpage, "table")
population_table <- html_table(tables[[2]], fill = TRUE)

# Print the first few rows of the table
cat("\nExtracted Data from Website:\n")
print(head(population_table))

#3 
# Load the diamonds dataset
data("diamonds")

# Pie chart of cut proportions
cut_counts <- table(diamonds$cut)
pie(cut_counts, main="Pie Chart of Diamond Cuts", col=rainbow(length(cut_counts)))

# Bar graph of cut counts
barplot(cut_counts, main="Bar Graph of Diamond Cuts", col=rainbow(length(cut_counts)))

#4

# Load the ChickWeight dataset
data("ChickWeight")

# Construct a plot of weight against time for chick number 34
chick_34 <- subset(ChickWeight, Chick == 34)
plot(chick_34$Time, chick_34$weight, type="b", col="blue", main="Weight vs Time for Chick 34", xlab="Time", ylab="Weight")

# Box plots for each time point for chicks in diet group 4
diet_4 <- subset(ChickWeight, Diet == 4)
boxplot(weight ~ Time, data = diet_4, main="Box Plots for Diet Group 4", xlab="Time", ylab="Weight")

# Compute mean weight for chicks in group 4 for each time point and plot
mean_weight_group_4 <- aggregate(weight ~ Time, data = diet_4, FUN = mean)
plot(mean_weight_group_4$Time, mean_weight_group_4$weight, type="b", col="red", ylim=c(min(mean_weight_group_4$weight), max(mean_weight_group_4$weight)), main="Mean Weight vs Time", xlab="Time", ylab="Mean Weight")

# Compute mean weight for chicks in group 2 for each time point and add to the plot
diet_2 <- subset(ChickWeight, Diet == 2)
mean_weight_group_2 <- aggregate(weight ~ Time, data = diet_2, FUN = mean)
lines(mean_weight_group_2$Time, mean_weight_group_2$weight, type="b", col="blue")

# Add legend and title
legend("topright", legend=c("Diet Group 4", "Diet Group 2"), col=c("red", "blue"), lty=1, cex=0.8)
title("Mean Weight vs Time for Diet Groups 4 and 2")

# Copy and paste the graph into Word (manually)
# You can use RStudio's "Export" button to save the plot and then insert it into Word.
