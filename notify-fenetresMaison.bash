#!/usr/bin/env bash

START=$(date +%s.%N)

#exit when command fails (use || true when a command can fail)
set -o errexit

#exit when your script tries to use undeclared variables
set -o nounset

#(a.k.a set -x) to trace what gets executed
#set -o xtrace

# in scripts to catch mysqldump fails 
set -o pipefail

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
ts=`date +'%Y%m%d-%H%M%S'`

#Set the config file
configFile='~/.binJlam/templateConfig'


#Capture everything to log
log=~/log/$__base-${ts}.log
#exec >  >(tee -a $log)
#exec 2> >(tee -a $log >&2)
touch $log
chmod 600 $log


#Check that the config file exists
#if [[ ! -f "$configFile" ]] ; then
#        echo "I need a file at $configFile with ..."
#        exit 1
#fi


### BEGIN SCRIPT ###############################################################

city=${1:-CYOW}
workDir=/tmp/$city/
mkdir -p $workDir
latestPath=$workDir/latest.txt

# We are tweeting either:
# Current and worst for the day
# Current and worst for tomorrow

# Lets start with the first (current and worst for the day)

# Get the last file of http://dd.weather.gc.ca/nowcasting/matrices/
fileURL=`lynx --dump http://dd.weather.gc.ca/nowcasting/matrices/ | tail -n 1 | cut -d ' ' -f 4`
# Unzip it (or uncompress it http://pubs.opengroup.org/onlinepubs/9699919799/utilities/compress.html)
curl -s $fileURL | gzip -dc | grep $city -A 28 > $latestPath

# Keep 7th line until the time is 2 AM Zulu
currentLine=`head -n 12 $latestPath | tail -n 1`

# From the 7th line (current), record the temperature (14th column T) and precipiration (5th column)
# See http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt
currentTemp=`echo $currentLine | cut -d '|' -f 13`
currentPrecip=`echo $currentLine | cut -d '|' -f 4`
currentPrecip="$(echo -e "${currentPrecip}" | tr -d '[[:space:]]')"
if [[ -z "$currentPrecip" ]]; then currentPrecip='none'; fi

set -x
if [[ "$currentPrecip" == "none" &&  `echo "$currentTemp > 19 && $currentTemp < 24" | bc ` -eq "1" ]]; then
	notice="Température $currentTemp.  Ouvrir fenêtre?"
else
	notice="Température $currentTemp, précipitation $currentPrecip.  Fermer fenêtre?"
fi

export DISPLAY=:0.0 && export XAUTHORITY=/home/ravi/.Xauthority
notify-send "$notice"
echo "$notice"
	

### END SCIPT ##################################################################

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo Done.  `date` - $DIFF seconds > $log
echo $DIFF seconds

