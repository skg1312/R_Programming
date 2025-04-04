# Install necessary packages if you haven't already
install.packages("dpylr")
install.packages("readr")

# Load the packages
library(dplyr)
library(readr)


# Create a sample dataset with 100 rows and some NA values
set.seed(123)  # For reproducibility
data <- data.frame(
  ID = 1:100,
  Name = paste0("Name", 1:100),
  Age = sample(c(20:60, NA), 100, replace = TRUE),
  Salary = sample(c(40000:100000, NA), 100, replace = TRUE)
)

# Introduce some NA values randomly
data$Age[sample(1:100, 10)] <- NA
data$Salary[sample(1:100, 10)] <- NA

# View the sample data
print(data)

# Write the dataset to a CSV file
write_csv(data, "Dataset.csv")


# Import the CSV file
data <- read_csv("Dataset.csv")

# Transform the data
data_transformed <- data %>%
  # Select specific columns
  select(Name, Age, Salary) %>%
  # Filter rows
  filter(Age > 35) %>%
  # Create a new column
  mutate(AnnualSalary = Salary * 12) %>%
  # Remove rows with missing values
  filter(complete.cases(.))

# Load the transformed data to a new CSV file
write_csv(data_transformed, "transformed_data.csv")

# View the transformed data
print(data_transformed, n = 42)
