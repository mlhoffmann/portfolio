library("dplyr")

# DataFrame starwars
sw <- starwars

class(sw)

class(sw$hair_color)
class(sw[,'hair_color'])

# filter function

nrow(filter(sw, height > 100))

nrow(sw[sw$height>100,])

nrow(sw[which(sw$height>100),])

filter(sw, height > 100)


# f(x, y)

# x %>% f(y) %>% f(z)

sw %>%
  filter(height > 100)

# glimpse function

sw %>%
  glimpse()

# Multiple functions
sw %>%
  filter(eye_color=='yellow') %>%
  count()

sw %>%
  filter(eye_color=='yellow',
         mass < 80) %>%
  count()


# Arrange 
sw %>%
  arrange(hair_color, mass)


# Mutate
sw_plus <- sw %>%
  mutate(height_x_mass = height*mass) %>%
  mutate(birth_year_10 = birth_year*10)

# Select 
sw %>%
  select(hair_color) %>%
  distinct() %>%
  count()

count(distinct(select(sw, hair_color)))

# Sample and sample_n
set.seed(1)
sw %>%
  sample_n(10)

# Sample and sample_frac
sw %>%
  sample_frac(0.2)

# Summarize and group_by
sw %>%
  summarise(avg = mean(height, na.rm = TRUE))

sw %>%
  summarise(max = max(height, na.rm = TRUE))

sw %>%
  summarise(min_var = min(height, na.rm = TRUE))

sw %>%
  group_by(eye_color) %>%
  summarise(avg_var = mean(height, na.rm = TRUE))


# Join Tables

origin <- data.frame(
  species = c('Human','Droid', 'Wookie'),
  origin = c('Earth', 'Outer Space', 'Outer Space')
)

sw_aug <- sw %>% 
  inner_join(origin, by='species')

sw %>% 
  right_join(origin, by='species')

sw %>% 
  full_join(origin, by='species')








































