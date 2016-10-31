
require 'nokogiri'
require 'open-uri'
require 'byebug'

require_relative './forecast.rb'

### BEGIN SCRIPT ###############################################################


city='YOW'

if ! ARGV[0].nil?
    city=ARGV[0]
end

# Lets start with the first (current and worst for the day)

# Get the last file of http://dd.weather.gc.ca/nowcasting/matrices/

urlBase='http://dd.weather.gc.ca/nowcasting/matrices/'

#doc = Nokogiri::HTML(open(urlBase))
fileURL=`lynx --dump #{urlBase} | tail -n 1 | cut -d ' ' -f 4`.chomp

data=`curl -s #{fileURL} | gzip -dc | grep #{city} -A 28`

# Keep 7th line of data (12th line of output) until the time is 2 AM Zulu
currentLine=data.split("\n")[11]

current = Forecast.new(currentLine)

forecastStrings=data.split("\n")

forecasts = forecastStrings[11..forecastStrings.size-1].map { |l|
    next if l[0] == '-'
    Forecast.new(l)
}.compact

maxPop=forecasts.max_by {|f|
    f.pop
}.pop

minWindChill=forecasts.min_by {|f| f.windChill}.windChill

minTemp=forecasts.min_by {|f| f.temp}.temp

=begin
puts maxPop
puts minWindChill
puts minTemp
=end

#Get sunset times
sunsetStr=`curl -s http://www.cmpsolv.com/cgi-bin/sunset?loc=#{city} | grep 'Sunset:'`.strip

sunset = sunsetStr.split(' ').last.strip



announceStr="Current/Worst: T: #{current.windChill}/#{minWindChill}, P: #{current.pcpType}/#{maxPop}\n"

forecasts.each { |f|
    announceStr += "#{f.hour}: #{f.pop}; " if f.pop >= 30
}

announceStr += "Sunset: #{sunset}"

announceStr.strip!


## Get sunset at
## http://www.cmpsolv.com/cgi-bin/sunset?loc=YOW

puts announceStr




=begin
	pop=`echo $pop | tr -d '[[:space:]]' | cut -d . -f 1` ;

	if [ "$pop" -gt "$maxPOP" ]; then
		maxPOP="$pop";
	fi

	if [ "$pop" -gt 50 ]; then
		time=`cat $latestPath  | grep -v '^-' | grep -v T | cut -d '|' -f 1 | tail -n 12 | cut -d ' ' -f 2 | head -n $counter | tail -n 1 | cut -c 1-2`
		time=`echo $time - 4 | bc  `
		if [ "$time" -lt 0 ] ; then time=`echo $time + 24 | bc  `; fi
		announcePOP=`echo "$announcePOP$time: $pop; "`
	fi

	let counter++

done;

# tweet it .  Together or worst weather if necessary
announce="Current/Worst: T: $currentTemp/$minTemp, P: $currentPrecip/$maxPOP;"


if [[ "${#announce}" -gt 140 ]] ; then
	>&2 echo "Announce string longer then 140 latin chars"
fi

echo $announce

if  [ ! -z "$announcePOP" ]; then
	echo $announcePOP
fi

ls -l $latestPath


### END SCIPT ##################################################################

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
echo Done.  `date` - $DIFF seconds > $log
echo $DIFF seconds


puts current
puts current.windChill()

data.split("\n").each {|l| puts l}
debugger
nil
=end

