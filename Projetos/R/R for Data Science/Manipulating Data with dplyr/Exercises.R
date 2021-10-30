library(dplyr)
# This is our example tibble (don't change this)
storms_df <- storms

# Filter all storms that are called Amy
# in the storms_df using dplyr commands
# Call the returning object amy_df

# Hint: The name of the storm is in the column
# name!
amy_df <- storms_df %>% filter(name=='Amy')

# Count the number of rows reffering
# tropical storms in the storms df.
# Call the returning object tropical_storms

# Hint: To identify tropical storms use
# the status column and search for "tropical storm"!

tropical_storms <- storms_df %>% filter(status=='tropical storm') %>% count()

# Create a new column in the storms_df called
# wind_x_pressure where you multiply the wind
# column by the pressure column

# rewrite the storms_df object

storms_df <- storms_df %>% mutate(wind_x_pressure = wind*pressure)

# Extract the distinct storm status 
# and save them in a status_storms named
# object

status_storms <- storms_df %>% select(status) %>% distinct()

# Extract the mean of the wind column
# store it in a mean_wind variable - the column
# that you want to name inside the dplyr operation
# should be called mean
mean_wind <- storms_df %>% summarise(mean = mean(wind))

# Create a tibble with two columns, one called 
# status that should contain the elements: 
# 'tropical depression', 'tropical storm', 'hurricane'

# The second column should be named type and contain
# the following elements
# 'A', 'B', 'C'

# named your tibble type_status

# Hint: Use the tibble command just like you use data.frame command!

type_status <- tibble(
  status = c('tropical depression', 'tropical storm', 'hurricane'),
  type = c('A', 'B', 'C')
)

# Join the storms_df with the type_status by status
# using an inner join
# Call the new df augmented_storms

augmented_storms <- storms_df %>% inner_join(type_status, by='status')