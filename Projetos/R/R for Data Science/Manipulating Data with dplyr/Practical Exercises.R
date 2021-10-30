library('dplyr')

# 1. Assign the iris dataset an objetct called iris_df
iris_df <- iris

# 2. Select only the setosa species from the iris_df object
iris_df %>%
  filter(Species == 'setosa')

# 3. Select only the columns Petal.Length and Petal.Width from the iris_df 
iris_df %>%
  select(Petal.Length, Petal.Width)

# 4. Select the column Petal.Length and filter only virginica species from the iris_df
iris_df %>%
  filter(Species == 'virginica') %>%
  select(Petal.Length) 


# 5. Check the mean of the *Sepal.Width* for each species using dplyr functions 
iris_df %>%
  group_by(Species) %>%
  summarise(mean = mean(Sepal.Width)) 

# 6. Select a sample of 15% of the rows of the iris_df object.
iris_df %>% 
  sample_frac(0.15)

# 7. Create a data frame called country with the following elements:
#   a. A Column named Species with values 'setosa', 'versicolor'
#   b. A column named country with the values 'belgium', 'netherlands'

country <- tibble(
  Species = c('setosa', 'versicolor'),
  country = c('belgium', 'netherlands')
)

# 8. Perform an inner join between the iris_df and the country data frame using 
# Species as a connector between both data frames.
iris_df_inner <- iris_df %>%
  inner_join(country, by='Species')

# 9. Perform a right join between the iris_df and the country data frame using Species 
# as a connector between both data frames.
iris_df_right <- iris_df %>%
  right_join(country, by='Species')

iris_df_right <- iris_df %>%
  full_join(country, by='Species')

# 10. Perform a slice on the iris_df, subsetting only rows between index number 35 and 48.
iris_df[35:48,]



