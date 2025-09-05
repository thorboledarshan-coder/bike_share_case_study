library(ggplot2)

# Bar chart: number of rides by day, split by member vs casual
p1 <-ggplot(summary_output, aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Number of Rides by Day of Week",
    subtitle = "Comparison between Members and Casual Riders",
    x = "Day of the Week",
    y = "Number of Rides",
    fill = "Rider Type"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Line chart: average ride length by weekday for members vs casuals
p2 <-ggplot(summary_output, aes(x = day_of_week, y = avg_ride_length, color = member_casual, group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Average Ride Length by Day of Week",
    subtitle = "Comparison between Members and Casual Riders",
    x = "Day of the Week",
    y = "Average Ride Length (minutes)",
    color = "Rider Type"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

#combining two plots in one frame or dashboard
p1/p2




