# Prepares an anonymised and clean dataset to be used for the analysis.


# Dependencies ------------------------------------------------------------

# Uncomment below to install all the required dependencies listed at deps.yml.
# install.packages("automagic") 
# automagic::automagic()

library(dplyr)
library(janitor)
library(stringr)
library(tidyr)

# Qualtrics responses -----------------------------------------------------

filename_responses <- "raw_dataset.csv"

df_responses <- read.csv(paste0("data/raw/", filename_responses),
                         skip = 1, na.strings = c("", " ")
) |>
  as_tibble() |>
  # Cleaning up messy column names (whitespaces, capitalisation...).
  janitor::clean_names() |>
  # Qualtrics adds comments to row one. They need to be removed.
  filter(row_number() != 1) |>
  # Removing testing data and people not accepting terms.
  filter(
    response_type != "Survey Preview",
    acceptance == "Yes"
  ) |>
  # Remove columns with only NA values
  select_if(function(x) {
    !all(is.na(x))
  }) |>
  # Remove unnecessary columns
  select(
    -response_type,
    -ip_address,
    -user_language,
    #-starts_with("response_id"),
    -starts_with("recipient_"),
    -starts_with("location_")
  ) |>
  # Rename long column names
  rename(
    
  )

# Write a clean file without information about respondents.
df_respondents <- df_responses |>
  # Remove unnecessary columns
  select(-duration_in_seconds, -user_language, -starts_with("training_"))

write.csv(
  df_respondents,
  "data/drtp_contribs_survey_respondents.csv",
  row.names = FALSE
)


# Training dataset -------------------------------------------------------

# Some people contributed with more than one training, which was stored in
# different variables. The code below generates another dataset with only
# information related to the trainings.

df_trainings <- df_responses |>
  select(response_id, starts_with("training_")) |> 
  # Make data long for easily renaming column names. (which will become values)
  pivot_longer(
    cols = !response_id
  ) |> 
  # Cleanup future column names so responses from different training have same
  # column names when transforming them to wide format.
  mutate(
    # Remove the training prefix.
    name = str_remove_all(name, "training_\\d"),
    # Remove any leading _ that may result from the previous.
    name = str_remove(name, "^_"),
    # Responses that allow "other" have duplicated strings in their name that
    # need to be cleaned. Use a lookbehind to anchor after "__" and a lookahead
    # to stop before "selected_choice"
    name = str_remove(name, "(?<=__).*?(?=selected_choice)"),
  ) |> 
  pivot_wider(
    id_cols = response_id, 
    names_from = name, 
    values_from = value
  ) |> 
  # Remove any empty training.
  filter(
   !is.na(training_name)
  )
  
write.csv(
  df_trainings, 
  file = "data/drtp_contribs_survey_trainings.csv",
  row.names = FALSE
)
