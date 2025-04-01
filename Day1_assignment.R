install.packages("writexl")
library(writexl)
#1. R Program to Compute Sum, Mean, and Product of a Given Vector Elements
# Create a vector
vec <- c(1, 2, 3, 4, 5)

# Compute sum of the vector elements
vec_sum <- sum(vec)
cat("Sum of vector elements:", vec_sum, "\n")

# Compute mean of the vector elements
vec_mean <- mean(vec)
cat("Mean of vector elements:", vec_mean, "\n")

# Compute product of the vector elements
vec_product <- prod(vec)
cat("Product of vector elements:", vec_product, "\n")


#2. R Program to Call the (Built-in) Dataset airquality

# Load the airquality dataset
data("airquality")

# Display the first few rows of the dataset
head(airquality)

#3. R"iris"#3. R Program to Create a List of Dataframes and Access Each of Those Data Frames from the List
# Create some example dataframes
df1 <- data.frame(A = 1:3, B = c("a", "b", "c"))
df2 <- data.frame(X = 4:6, Y = c("d", "e", "f"))

# Create a list of dataframes
df_list <- list(df1 = df1, df2 = df2)

# Access each dataframe from the list
cat("Dataframe df1:\n")
print(df_list$df1)

cat("\nDataframe df2:\n")
print(df_list$df2)

# 4 Install and load the writexl package if not already installed
if (!require("writexl")) install.packages("writexl", dependencies=TRUE)
library(writexl)

# Create a dataframe
df <- data.frame(
  Name = c("John", "Doe", "Alice", "Bob"),
  Age = c(28, 34, 23, 45),
  Score = c(85, 92, 78, 88)
)

# Get the statistical summary of the dataframe
cat("Statistical Summary:\n")
summary(df)

# Get the structure of the dataframe
cat("\nStructure of the dataframe:\n")
str(df)

# Add a new column to the dataframe
df$Grade <- c("A", "A+", "B", "A")

# Sort the dataframe using multiple columns (Age and then Score)
df_sorted <- df[order(df$Age, df$Score),]

cat("\nSorted Dataframe:\n")
print(df_sorted)

# Export the dataframe to an Excel file using writexl package
write_xlsx(df_sorted, "sorted_dataframe.xlsx")
cat("\nDataframe has been exported to 'sorted_dataframe.xlsx'\n")
