library(tidyverse)
##Data Science: Wrangling

##################
# Data wrangling #
##################

# It is common for data to be stored in a file, a database, 
# or extracted from a document, including web pages, tweets, or PDFs. 

# Data wrangling is a process to convert data from its raw form to the tidy form 
# that greatly facilitates the rest of the analysis

##################################################
# Course/Section 1: Data Import/1.1: Data Import #
##################################################
# when you are working in R,it is important to know your working directory

# see working directory
getwd()

# change your working directory
setwd("C:/Users/YiFanta/Desktop/Data analysis with R & R studio/R Training Scripts")

# We can view the files included in this directory 
# using the function list.files()

list.files()

# let us change back our directory 
setwd("C:/Users/YiFanta/Desktop/Data analysis with R & R studio/R Training Scripts/Data Science Wrangling")


# In our previous course we have been using US murders data
# This data is stored in our computer when we installed dslabs package
# The data is stored in "extdata" folder
# We can view the directory where R stored "extdata" folder
# using the function system.file()

system.file("extdata", package = "dslabs")

# we can define this specific file location "path" 
# so that we can easily reference it
path<-system.file("extdata", package = "dslabs")
# we can now easily see what other files we were provided
# as part of dslabs package in this folder using the function list.files
list.files(path)

#........copying a data file from one folder to another.........

# we can now copy "murders.csv" from from where it was saved 
# by default on our pc to our working directory
# it is important to define the full path since there are 
# different representation of a directory in MS, Mac & Linux 
 
filename <- "murders.csv"  
dir <- system.file("extdata", package = "dslabs") 
fullpath <- file.path(dir, filename)
file.copy(fullpath, "murders.csv")
####################
file.exists("murders.csv")
# [1] TRUE

# generate a full path to a file
filename2 <- "fertility-two-countries-example.csv"
fullpath2 <- file.path(path, filename2)
fullpath2

# copy file from dslabs package to your working directory
file.copy(fullpath2, getwd())

# check if the file exists
file.exists(filename2)
# once we get our file paths, then how can we read the data

read.csv(fullpath)
read_csv(fullpath)
read_lines(fullpath)
################################
# The readr and readxl Packages#
################################

#   .....The readr and readxl Packages......
library(dslabs)
library(tidyverse)    # includes readr
library(readxl)

# inspect the first 3 lines
read_lines("murders.csv", n_max = 3)

# read file in CSV format
dat_1 <- read_csv(filename)
dat_2 <- read.csv(filename)
dat_1
dat_2
#read using full path
dat <- read_csv(fullpath)
head(dat)

#Ex:
path <- system.file("extdata", package = "dslabs")
files <- list.files(path)
files

filename <- "murders.csv"
filename1 <- "life-expectancy-and-fertility-two-countries-example.csv"
dat=read.csv(file.path(path, filename))
dat1=read.csv(file.path(path, filename1))
# Note that read_csv() reads from the working directory
# If we need to read file from a diffrent directory, then
# we need to file.path(path, filename) in the read_csv() function
dat_3<-read_csv(file.path(path,filename))
dat_4<-read.csv(file.path(path,filename),stringsAsFactors=TRUE)
# ......Importing Data Using R-base Functions....


# filename is defined in the previous video
# read.csv converts strings to factors
view(dat)
dat1 <- read.csv(filename)
class(dat1$abb)
class(dat1$region)
class(murders$region)
class(dat_3$abb)
class(dat_4$abb)
#######################################
# Downloading Files from the Internet #
#######################################
# Define the url as R object
url_2 <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"

url<-"https://data.chhs.ca.gov/dataset/31f19bf7-2ca3-4834-8e2f-5551c0c72c8c/resource/f349bee2-550e-4043-a0ea-5c307da85a51/download/covid19_patient_07.30.2021.csv"
download.file(url, "COVID-19 Patient.csv")
tempfile()
tmp_filename <- tempfile()
download.file(url, tmp_filename)
dat <- read_csv(tmp_filename)
file.remove(tmp_filename)
####..............


###################################
# Summary with a familiar example #
###################################

# let us explore an excel file called Denom 10-year groups 2000-2020 Long
# From the S drive, copy it on our working directory
# explore the content
# Define our excel file name as R Object
myfilename<-"Denom 10-year groups 2000-2020 Long.xlsx"
# Define file path as R Object
## mypath<-"S:\Cape\Data\Current Denominators"  doesn't work
mypath<-"S:/Cape/Data/Current Denominators"
# Define full path as R Object
myfullpath<-file.path(mypath,myfilename)
my_data<-read_xlsx(myfullpath)
view(my_data)
# copy it on our working directory
file.copy(myfullpath,myfilename)
# let us check if the file is now available in our working directory
file.exists("Denom 10-year groups 2000-2020 Long.xlsx")
# read our excel file data data
Denom10<-read_excel(file.path(mypath,myfilename))
# Explore our data
names(my_data)
head(Denom10)
str(my_data)
class(Denom10$Year)
class(Denom10$Sex)

## Downloading Files from the Internet ###

url <- "https://data.chhs.ca.gov/dataset/58619b69-b3cb-41a7-8bfc-fc3a524a9dd4/resource/579cc04a-52d6-4c4c-b2df-ad901c9049b7/download/2021-04-14_deaths_final_2014_2019_county_year_sup.csv"
dat <- read_csv(url)
download.file(url, "2021-04-14_deaths_final_2014_2019_county_year_sup.csv")
tempfile()
tmp_filename <- tempfile()
download.file(url, tmp_filename)
dat <- read_csv(tmp_filename)
file.remove(tmp_filename)

#################################
# reading different datasets

read_csv(file.path(system.file("extdata", package = "dslabs"), "olive.csv"))
read_xls(file.path(system.file("extdata", package = "dslabs"), "2010_bigfive_regents.xls"))
race_times <- read.csv("data/times.txt")
read_lines("wdbc.data")
read_csv("wdbc.data")
read_lines("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data")
read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data", col_names=FALSE)
