# =========================
### Travers Parsons-Grayson
### Interactive Graph
### MATH 301: Spring 2019
# =========================


# -------------------------
# File for global variables
# -------------------------

# Libaries
# =============
library(shiny)
library(leaflet)
library(dplyr)
library(readr)
library(shinythemes)
library(rlist)
library(imager)
# =============

# Read in data files
iraq_stats <- read_csv('datafiles/cleanedData.csv')
top  <- read_csv("datafiles/topCat.csv")

# Create lists for use with buttons and sliders
toppy <- list.append(top$Category,"All","None")
target <- list("NEUTRAL","ENEMY","FRIEND","All")

# create custom icons for our map
icons <- awesomeIcons(
  icon = 'ios-close',
  library = 'ion',
  iconColor = "black"
)

# Make sure directory is current one
shinyAppDir(".")
