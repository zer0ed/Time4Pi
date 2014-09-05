Time4Pi
=======

Time4Pi is a small shell script which speaks the current time and weather via audio output. It was designed for use on the Raspberry Pi but will work with any Linux machine. It's intended use is to set it up as a cronjob to speak the time and weather hourly. Obviously you can set it up to run at any interval you like.

The script uses an unofficial call out to Google's Text to Speech engine as the speech quality is much better than festival or espeak. Output text is sent to Google's TTS (translate) servers, the response is a speech file which is played back locally via mplayer. Internet connectivity is required because of this dependency on Google's servers. A sound card, driver, speakers, and mplayer are also required for audio playback.

Weather info is pulled down from NOAA (USA National Oceanic and Atmospheric Administration) via weather-util and as such weather-util is a dependency of this script. NOAA us largely US based it but does contain weather information for some locations outside of the United States. Supported locations can be found at http://weather.noaa.gov

This project is still a work in progress. Sometimes the output from weather-util doesn't contain the needed info for Time4Pi and as such the weather is said in broken english. I plan on adding proper checks for this info and more configuration options in the future.


Features:
---------

* Speaks the current time
* Speaks the current weather (temperature, sky conditions, relitive humidity)
* Simple, and uses little resources
* Uses mplayer, weather-util, and Google's TTS servers.


Installation:
-------------

1. Install the dependencies (mplayer, weather-util) within your distro.
2. Edit /etc/mplayer/mplayer.conf and add the following (stops an mplayer error message)

> nolirc=yes 

3. chmod +x the time4pi.sh to allow execution (if the permission isn't already set)
4. Set your location in the time4pi.sh file under the # set location section. You can obtain the proper code for your location by visiting http://weather.noaa.gov or by typing "weather-util [keyword]" (without quotes) in a terminal to search.
5. Run the time4pi.sh script to test
6. Setup a cronjob via the usual methods


Credit:
-------

The code for using Google's TTS service came from the following sites.

http://elinux.org/RPi_Text_to_Speech_(Speech_Synthesis)
http://874.org.uk/speaking-weather-forecast-raspberry-pi.html
