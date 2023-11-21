summary_data <- DF$semdat %>% select(starts_with("y")) %>% 
  pivot_longer(cols = starts_with("y"), names_to = "variable", values_to = "value") %>% 
  mutate(time = as_numeric(str_extract(variable, "y(\\d+)"))) %>% 
  group_by(time) %>%
  summarise(mean_value = mean(value, na.rm = TRUE),
            sd_value = sd(value, na.rm = TRUE),
            n = sum(!is.na(value))) %>% 
  mutate(ci_lower = mean_value - 1.96 * (sd_value / sqrt(n)),
         ci_upper = mean_value + 1.96 * (sd_value / sqrt(n)))

# Create the plot
ggplot(summary_data, aes(x = time, y = mean_value)) +
  geom_line() +
  geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper), alpha = 0.3) +
  labs(title = "Mean with 95% CI for AfD-Sympathy",
       x = "Wave",
       y = "AfD-Sympathy") +
  scale_x_continuous(breaks = summary_data$time) +
  ylim(2,4)
theme_minimal()



summary_data <- DF$semdat %>% select(starts_with("x")) %>% 
  pivot_longer(cols = starts_with("x"), names_to = "variable", values_to = "value") %>% 
  mutate(time = as_numeric(str_extract(variable, "x(\\d+)"))) %>% 
  group_by(time) %>%
  summarise(mean_value = mean(value, na.rm = TRUE),
            sd_value = sd(value, na.rm = TRUE),
            n = sum(!is.na(value))) %>% 
  mutate(ci_lower = mean_value - 1.96 * (sd_value / sqrt(n)),
         ci_upper = mean_value + 1.96 * (sd_value / sqrt(n)))

# Create the plot
ggplot(summary_data, aes(x = time, y = mean_value)) +
  geom_line() +
  geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper), alpha = 0.3) +
  labs(title = "Mean with 95% CI for Media Trust",
       x = "Wave",
       y = "MediaTrust") +
  scale_x_continuous(breaks = summary_data$time) +
  theme_linedraw()
