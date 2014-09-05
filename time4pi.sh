#!/bin/bash

####################### [USER CONFIGURATION] #######################

# set location
loc="cyqg"	# Windsor, Ontario, Canada



############################ [MAIN CODE] ############################
# DO NOT alter below this line unless you know what you are doing!

# google translate tts function
say() 
{   
local IFS=+;/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=en&q=$*";
}
say $*

# grab the current weather to a file
weather-util $loc > weather.txt

# set the time
thetime="The time is now $(date '+%l:%M %p')."

# set the weather
temp=$(grep Temperature weather.txt | cut -c16-19)	# Temperature (F)
hum=$(grep Humidity weather.txt | cut -c23-25)	# Relitive Humidity
sky=$(grep Sky weather.txt | cut -c20-40)	# Sky Conditions

# speak the time
say "$thetime"

# speak the weather
say "It is currently $temp degrees outside and $sky."
say "Relitive humidity is at $hum."

