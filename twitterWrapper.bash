#!/usr/bin/env bash

START=$(date +%s.%N)

#exit when command fails (use || true when a command can fail)
set -o errexit

#exit when your script tries to use undeclared variables
set -o nounset

#(a.k.a set -x) to trace what gets executed
set -o xtrace

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
exec >  >(tee -a $log)
exec 2> >(tee -a $log >&2)
touch $log
chmod 600 $log


#Check that the config file exists
#if [[ ! -f "$configFile" ]] ; then
#        echo "I need a file at $configFile with ..."
#        exit 1
#fi


echo Begin `date`  .....

### BEGIN SCRIPT ###############################################################

city=${1:-CYOW}
latestDataPath="$__dir/.latestURL.txt"
twitterMsg="$__dir/.twitterMsg.txt"

# Regarder la liste des fichier
fileURL=`lynx --dump http://dd.weather.gc.ca/nowcasting/matrices/ | tail -n 1 | cut -d ' ' -f 4`

# Déterminer si le fichier a changé depuis la dernière fois
lastRead=''
if [ -f "$latestDataPath" ] ; then lastRead=`cat $latestDataPath`; fi

if [ "$lastRead" = "$fileURL" ] ; then
	echo No new data published
	exit 0
fi


# Si oui, 
## Sauvegarder le nom du dernier fichier
printf $fileURL > $latestDataPath

## exécuter main.bash, ne pas sauver la dernière ligne 
$__dir/main.bash | sed '$ d' > $twitterMsg

# Tweeter chaque ligne
cat $twitterMsg | xargs echo 

# Voir https://dev.twitter.com/rest/reference/post/statuses/update pour l'API


### END SCIPT ##################################################################

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo Done.  `date` - $DIFF seconds
