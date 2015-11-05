# Exploratory Data Analysis Project 1

### Candice, November 04, 2015

*README.md description: This README.md explains the purpose of the scripts and graphic files contained in this repo and how they are connected.*

## Dataset: 
Dataset: Individual household electric power consumption Data Set: Electric power consumption [20Mb]

Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available. Data are taken from the UC Irvine Machine Learning Repository web site (http://archive.ics.uci.edu/ml/).

## The following descriptions of the 9 variables in the dataset (as taken from the UC Irvine Machine Learning Repository web site) are: 
1.  Date: Date in format dd/mm/yyyy
2.  Time: time in format hh:mm:ss
3.  Global_active_power: household global minute-averaged active power (in kilowatt)
4.  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5.  Voltage: minute-averaged voltage (in volt)
6.  Global_intensity: household global minute-averaged current intensity (in ampere)
7.  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8.  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9.  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

The dataset has 2,075,259 rows and 9 columns. A rough estimate of how much memory the dataset will require in memory before reading into R is calculated as memory required = no. of column * no. of rows * 8 bytes/numeric: 
GB memory required = 0.139157; MB memory required = 142.4967; KB memory required = 145916.6

## Plotting the data: 

Four plots are required to complete this project. Each plot has a plot-specific script. These scripts are required to load the data from the online data source, clean and reformat (tidy) the data, construct the requested plot, and save the plot to a PNG file with a width of 480 pixels and a height of 480 pixels.

The four plots are named plot1.png, plot2.png, etc. respectively.
The four scripts are named plot1.R, plot2.R, etc. respectively. 

The required plots are:
1.  A histogram of global active power frequency
2.  A line plot of time in days vs global active power (kilowatts)
3.  A line plot of time in days vs subsets of energy sub-metering
4.  Multiple base plots summarizing time vs four variable from power consumption dataset 


