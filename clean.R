# =========================
### Travers Parsons-Grayson
### Interactive Graph
### MATH 301: Spring 2019
# =========================


# -------------------------
# File for Cleaning Data
# -------------------------

# ==================
library(readr)
library(dplyr)

deaths <- read_csv("datafiles/Deaths only.csv")
# ==================

### =====================
### Clean Overall Dataset
### =====================

# Rename columns for simplicity
# =============================
colnames(deaths)[which(names(deaths) == "Enemy kia")] <- "enemyKia"
colnames(deaths)[which(names(deaths) == "Civilian kia")] <- "civKia"
colnames(deaths)[which(names(deaths) == "Coalition forces killed")] <- "coalKia"
colnames(deaths)[which(names(deaths) == "Iraq forces killed")] <- "iraqKia"
colnames(deaths)[which(names(deaths) == "Date and time")] <- "date"
colnames(deaths)[which(names(deaths) == "Total deaths")] <- "totalDeaths"
deaths = deaths %>% mutate(year = substring(date,7,10))

# Add popups for visual
deaths <- deaths %>% 
  mutate(popup_info = paste("<b>Category:<b>", Category, "<br />",
                            "<b>Coalition Forces Killed:<b>", coalKia, "<br />",
                            "<b>Iraqi Forces Killed:<b>", iraqKia, "<br />",
                            "<b>Enemy Forces Killed:<b>", enemyKia, "<br />",
                            "<b>Civilians Killed:<b>", civKia, "<br />",
                            "<b>Date and Time:<b>", date, "<br />",
                            "<b>Description:<b>", Title, "<br />"))

# Remove columns we do not need
deaths <- deaths %>% select(c("Category","Title","Attack on","totalDeaths",
                    "Latitude","Longitude","popup_info","year"))

# create cut-down file
write_csv(deaths,"datafiles/cleanedData.csv")


### ==============================
### Create file for top categories
### ==============================

# Convert Categories to lowercase so we do not have duplicates
counts = deaths  %>% mutate(Category = tolower(Category)) %>% 
  group_by(Category) %>% summarise(N= n()) %>% arrange(desc(N))

# Take the categpies with the most deaths
top = head(counts,10)

write.csv(top,"datafiles/topCat.csv")
