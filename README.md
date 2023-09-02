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
  
# Querying the dataset and exploratory analysis using MySQL Workbench

1. Extracting the global infection and death rates:
    
  Self Explanatory, Queried the necessary columns and made a running total for the cases, deaths, and the percentage of each

2. Queried the country's population density and infection rate, to see how much of a factor it is in the spread. Ended up not using this data.

3. Extracting each country's case number and HDI in an attempt to gauge that country's healthcare and see if it were a factor in survivability. Ended up not using this data.

4. Total cases, deaths, and percentages for each country.
  
5. Total cases, deaths, and percentages for each continent.



# Visualizing the data using Power BI
- Started first thing with 2 slicers, one for time and the other for location.
- Added 3 cards:
  - One that shows total cases for selected time and space frames.
  - One that shows total deaths for selected time and space frames.
  - One that shows average death percentage for selected time and space frames.
- Added a table that shows continents, countries, populations, total cases, total deaths.
- Add a bar line chart that shows total cases for each continent, and total deaths on the secondary Y-axis.
- Added two area charts showing the developement of case and death numbers for the selected time and space frame.
- Showed a world map that shows which countries have the largest numbers of cases.

# Insights
- The USA rules supreme when it comes to the number of active and has been throughout most of the period of study. This may be due to a myriad of reasons, such as the slow response of the government, the American peoples' initial lack of cooperation with lockdown procedures, and the May 2020 BLM riots.
- India is second place when it comes to the cases, this is most likely due to the massive population density, and the poor hygiene the populace has access to.
- The USA also suffers the highest count of deaths, which isn't surprising since it leads the case count by a massive number over India. It can be assumed that hospitals were overwhelmed, but that applies to most countries
- The number of cases continues to rise and shows no signs of slowing down. But my friend from the future paid me a visit and told me that by 2023, COVID will be nothing but a memory.
- 
# RECAP
My first project. Not entirely happy with it, there's always room to improve, but it gets the job done more or less, every visual responds to slicers, and one can extract insights from it. It's only uphill from here!


