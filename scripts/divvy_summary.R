# Standardize column names
q1_2019 <- Divvy_Trips_2019_Q1_updated %>% 
  
  rename(ride_id = trip_id,
         rideable_type = bikeid,
         started_at = start_time,
         ended_at = end_time,
         member_casual = usertype)

q1_2020 <- Divvy_Trips_2020_Q1_updated %>%
  rename(ride_id = ride_id,
         rideable_type = rideable_type,
         started_at = started_at,
         ended_at = ended_at,
         member_casual = member_casual)

# Merge datasets
all_trips <- bind_rows(q1_2019, q1_2020)

# Convert types to character in both dataframes
q1_2019 <- q1_2019 %>% mutate(ride_id = as.character(ride_id))
q1_2020 <- q1_2020 %>% mutate(ride_id = as.character(ride_id))
q1_2019 <- q1_2019 %>% mutate(rideable_type = as.character(rideable_type))
q1_2020 <- q1_2020 %>% mutate(rideable_type = as.character(rideable_type))

#deleting columns
q1_2019 <- q1_2019 %>% select(-c(max_ride_length, average_ride_length, mode_of_days))
q1_2020 <- q1_2020 %>% select(-c(max_ride_length, avg_ride_length))


# Now bind works
all_trips <- bind_rows(q1_2019, q1_2020)

#check string types
str(q1_2019)
str(q1_2020)


# Average ride length
mean(all_trips$ride_length, na.rm = TRUE)
max(all_trips$ride_length, na.rm = TRUE)
#mode_day <- all_trips %>%
#count(day_of_week, sort = TRUE) %>%
# slice(1)
# mode_day



# Summary table
summary_output <- all_trips %>%
  group_by(member_casual, day_of_week) %>%
  summarise(avg_ride_length = mean(ride_length, na.rm = TRUE),
            number_of_rides = n(),
            .groups = "drop")

# Export to CSV
write_csv(summary_output, "divvy_summary.csv")




