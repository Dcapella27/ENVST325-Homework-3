# Loading in libraries
library(ggplot2)
library(patchwork)


# Read in the Data
climateChangeData <- read.csv("/cloud/project/activity03/climate-change.csv")
co2EmissionsData <- read.csv("/cloud/project/activity03/annual-co-emissions-by-region.csv")

# Change Column names
colnames(co2EmissionsData)[4] <- "CO2"

# convert the entity names to factor and store a variable with levels for
# easy reference
co2EmissionsData$Entity <- as.factor(co2EmissionsData$Entity)

# make a vector of all levels
name.Ent <- levels(co2EmissionsData$Entity)

# Look at country names
name.Ent

# Homework 3 Question 1

# Create separate dataframe for Saudi Arabia and the United States

saudiUS <- co2EmissionsData[co2EmissionsData$Entity == "Saudi Arabia" |
                              co2EmissionsData$Entity == "United States", ]

# Graph Saudi Arabi and United States C02 Emissions
ggplot(data = saudiUS, aes(x = Year, y=CO2, color=Entity)) + 
  geom_point() +
  geom_line() +
  xlab("Year") + 
  ylab("Saudia Arabia & US Fossil Fuel Emissions (tons CO2)") +
  theme_classic()

# Homework 3 Question 2

# Graphing Global Fossil Fuel Emissions
p1 <- ggplot(data = co2EmissionsData, aes(x = Year, y = CO2)) +
  geom_line(color = "green") +
  xlab("Year") +
  ylab("Global Fossil Fuel Emissions (tons CO2)") +
  theme_classic()

p1

# Creating a seperate dataframe for world air temperatures
worldAirTemp <- climateChangeData[climateChangeData$Entity == "World",]

# Changing Day column to Date
worldAirTemp$Day <- as.Date(worldAirTemp$Day)

# Graphing global air temperatures
p2 <- ggplot(data = worldAirTemp, aes(x = Day, y = temperature_anomaly)) +
  geom_line(color = "red") +
  xlab("Year") +
  ylab("Global Air Temperature ") +
  theme_classic()

p2

# Put both plots side by side
p1 + p2

# Homework 3 Question 3

# Read in natural disaster data
naturalDisasters <- read.csv("/cloud/project/activity03/natural-disasters.csv")

# Visaulize the distribution of deaths from disasters
ggplot(data = naturalDisasters, aes(x = Year, y = Number.of.deaths.from.disasters)) + 
  geom_line(color = "red") +
  ylab("Number of Deaths from Disasters") +
  theme_classic()


