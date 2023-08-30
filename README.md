# Overview
 End-to-end data dashboard analyzing the spread of COVID-19 and its casualties.
 It's not very beautiful but it's built with simplicity in mind so everyone can use it.

 Timeframe of the study: 2020-01 to 2021-05
 
 This is my first project and it is mostly unguided, it has significance because my father died indirectly to COVID-19. His cardiovascular condition was exacerbated by Hydroxychloroquin, a malaria medicine that was administered to covid victims in third world countries.

 I originally intended to also compare countries' HDI to the percentage of people dying to COVID, as a way to gauge the effectiveness of their hospital
 As well as comparing new case rate with population density. These ideas never saw the light of day unfortunately, I settled for the dashboard only.

# Resources and tools used
- COVID dataset provided by [Our World in Data](ourworldindata.org)
- Microsoft Excel for preliminary cleaning and analysis of the data, and converting it into a .csv file
- Notepad++ and [CSV Lint](csvlint.io) to generate an SQL script to load the data into a database, as well as check the data types
- MySQL Workbench for querying the dataset
- Power BI to visualize the data

# Preliminary look and cleaning of the dataset

Used Microsoft Excel to do the following:
  - Remove the columns deemed unnecessary, keeping only those I deemed necessary
  - Reorganized the columns in an order that suits the analysis

# Preparing the dataset for import
  - Exported the Worksheet as a .csv file
  - Used CSV Lint to convert the .csv file into a .sql script that will import the data from it
  
# Querying the dataset and exploratory analysis
# Visualizing the data