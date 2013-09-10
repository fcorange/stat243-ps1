#!/bin/sh

#  problem1-3.sh
#  
#
#  Created by Frank Chen on 9/9/13.
#

# Download UN data
#?????

# Unzip UN data
unzip UNdata_Export_20130909_000534982.zip

# Rename the zip file
mv UNdata_Export_20130909_000534982.csv UNdata.csv

# View UN data to get a sense of how it's like
cat UNdata.csv

# Format the .csv file for next steps
#sed ’s/, / /g’ UNdata.csv > UNdata_Fmt.csv
#sed ’s/\"//g’ UNdata_Fmt.csv > UNdata_fmt.csv

# Subset the original data by country/region
sed '/+/d' UNdata.csv > UNdata_Country.csv  # Delete all lines with a "+" sign to obtain country data
sed '/+/!d' UNdata.csv > temp.csv           # Delete all lines without "+" as a temp file
head -1 UNdata.csv > UNdata_Region.csv      # Obtain the header
cat temp.csv >> UNdata_Region.csv           # Append the temp file to the header, resulting the region file
rm temp.csv                                 # Delete the temp file

# Subset the country data by year 2005
sed '/"2005"/!d' UNdata_Country.csv > UNdata_Country_2005.csv

