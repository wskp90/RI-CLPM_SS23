rm(list= ls()) # start clean ####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sjlabelled,foreign,tidyverse,sjmisc,Hmisc,panelr,gt,gtExtras,
               here,fs,usethis,labelled,janitor,magrittr,qs,tictoc,
               psych,easystats,irr,lavaan,semTools,semPlot,broom,tidySEM)
DF = list()
DF$orgdat = qread(paste0(Sys.getenv("FAUBOX"),"/GLES/za6838/za6838_7730.qs"))
afd_dat = DF$orgdat %>% select(ends_with("_430i") & !starts_with("kpa2"))

add_zero_to_var_names <- function(df) {
  df %>%
    rename_all(~str_replace(., "kp([1-9])(_.*)?$", "kp0\\1\\2"))
}
# Apply the function to the sample data frame
afd_dat <- add_zero_to_var_names(afd_dat)

afd_dat = afd_dat %>% mutate(across(everything(), ~ as_numeric(.)))
negative_indices <- which(afd_dat < 0, arr.ind = TRUE)
negvals <- afd_dat[negative_indices] %>% as.vector() %>% unique() %>% sort()
rm(negative_indices)

go_away <- function(x, na_values) {
  x[x %in% na_values] <- NA
  return(x)
}

afd_dat = afd_dat %>% mutate(across(everything(), ~(go_away(., negvals))))
afd_dat = afd_dat %>% mutate(across(everything(), ~ as_numeric(.)))


afd_columns <- grep("_430i", colnames(DF$orgdat), value = TRUE)

df_long <- afd_dat %>%
  pivot_longer(cols = starts_with("kp"), names_to = "variable", values_to = "value")

# Extract the time information from the variable names
df_long <- df_long %>%
  mutate(time = as.numeric(str_extract(variable, "\\d+")))

# Calculate mean and standard deviation for each time point and variable
summary_data <- df_long %>%
  group_by(time) %>%
  summarise(mean_value = mean(value, na.rm = TRUE),
            sd_value = sd(value, na.rm = TRUE),
            n = sum(!is.na(value)))

# Calculate confidence interval
summary_data <- summary_data %>%
  mutate(ci_lower = mean_value - 1.96 * (sd_value / sqrt(n)),
         ci_upper = mean_value + 1.96 * (sd_value / sqrt(n)))

# Create the plot
ggplot(summary_data, aes(x = factor(time), y = mean_value, group=1)) +
  geom_line() +
  geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper), alpha = 0.3) +
  labs(title = "Mean with 95% CI for AfD-Sympathy",
       x = "Wave",
       y = "AfD-Sympathy") +
  ylim(2,4) +
    theme_minimal()
