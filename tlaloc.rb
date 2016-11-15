#!/usr/bin/ruby

require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'getoptlong'


require_relative './forecast.rb'

### BEGIN SCRIPT ###############################################################

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ '--city', '-c', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--twitter', '-t', GetoptLong::NO_ARGUMENT ],
  [ '--debug', '-d', GetoptLong::NO_ARGUMENT ]
)


city='YOW'
twitter=false
debug=false

opts.each do |opt, arg|
  case opt
    when '--city'
        city=arg
    when '--twitter'
        require_relative './twitterConfig.rb'
        twitter=true
    when '--debug'
        debug=true
    else
        puts "[-c|--city {$city}] [-t|--twitter]"
        puts "[-t|--twitter] Push output to twitter"
        puts "[-d|--debug] Debug mode.  Don't push to twitter, print data output."
        puts "[-h|--help] Show this help screen"
        exit 1
  end
end



### If the data file is more than 5 minutes old, get a new one
minuteOfCache = 27
dataLocation = '/tmp/tlaloc.ecData.txt'
n = DateTime.now
if ! File.exists?(dataLocation) or (File.stat(dataLocation).mtime < DateTime.new(n.year, n.month, n.day, n.hour, minuteOfCache))
    puts "Refreshing cache because cache is before #{minuteOfCache} minute of the hour" if (debug or twitter)
    urlBase='http://dd.weather.gc.ca/nowcasting/matrices/'
    fileURL=`lynx --dump #{urlBase} | tail -n 1 | cut -d ' ' -f 4`.chomp
    `curl -s #{fileURL} | gzip -dc > #{dataLocation}`
end

#### Now get the data for your city
data = `cat #{dataLocation} | grep #{city} -A 28`
if data.nil?
    puts $stderr.puts "No EC data for #{city}"
    exit 1
end

## Get sunset at
## http://www.cmpsolv.com/cgi-bin/sunset?loc=YOW

# First store the file if it's a new day
sunsetLocation = "/tmp/tlaloc.sunset.#{city}.html"
if ! File.exists?(sunsetLocation) or File.stat(sunsetLocation).mtime < DateTime.now.beginning_of_day()
    puts "Refreshing sunset times" if (debug or twitter)
    `curl -s http://www.cmpsolv.com/cgi-bin/sunset?loc=#{city} > #{sunsetLocation}`
end

# Get the sunset time from the cached file
sunsetStr=`cat #{sunsetLocation} | grep 'Sunset:'`.strip
if sunsetStr.split(' ').last.nil?
    puts $stderr.puts "No sunset data for #{city}"
    exit 1
end
sunset = sunsetStr.split(' ').last.strip

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

minTempFc=forecasts.min_by {|f| f.temp}
minTemp = minTempFc.temp

isThereWindChill = current.windChill? || minTempFc.windChill?

untilHour=forecasts.max_by {|f| f.dateTime}.hour


windChillLabel = minTemp < 10 ? 'Windchill' : 'Temperature'

bodyStr="Current/Worst: #{windChillLabel}: #{current.windChill}/#{minWindChill}, POP: #{current.pcpType}/#{maxPop}; Sunset: #{sunset}\n"

popStr=''
i=0
forecasts.each { |f|
    if f.pop >= 30
        i += 1
        if i==1
            popStr += "#{f.hour}:00: #{f.pop}%; "
        else
            popStr += "#{f.hour}: #{f.pop}; "
        end
    end
}

windStr = ''
windTimes = ''
finalStr = bodyStr

i=0
if twitter
    twitterMaxChars = 140
    finalStr = '#' * (twitterMaxChars + 10)
    attempt=0

    while(finalStr.length >= 140)
        attempt+=1

        case attempt
        when 1
            announceStr = "Your #ottbike #ottweather until #{untilHour+1}:00: "
        when 2
            windTimes = ''
        when 3
            windStr = ''
        when 4
	        announceStr = "#ottbike #ottweather until #{untilHour+1}:00: "
        when 5
            windChillLabel = minTemp < 10 ? 'Wc' : 'T'
	        bodyStr="Current/Worst: #{windChillLabel}: #{current.windChill}/#{minWindChill}, P: #{current.pcpType}/#{maxPop}; S: #{sunset}\n"
        when 10
	        popStr=''
		    forecasts.each { |f|
	            strLength = finalStr.length
			    if f.pop >= 30
			        i += 1
			        if i==1
			            popStr += "POP > 30% @ #{f.hour}:00"
			        elsif strLength < 140 - 5
			            popStr += ", #{f.hour}"
	                else
	                    popStr += '+'
	                    break
			        end
		        end
	        }
        else
            finalStr = finalStr[0,twitterMaxChars-1]
        end


        finalStr = announceStr + bodyStr + windStr + popStr + windTimes

    end

	end


finalStr.strip!

unless twitter
    puts finalStr
else
	client = Twitter::REST::Client.new($clientConf)

	if client
	   puts "Client ready"
       unless debug
         r = client.update(finalStr)

         if ! r.nil?
            puts "Announced!"
            puts r.url
         else
            puts "Annouced failed"
         end
      else
         puts "Debug on, not announcing"
      end
      puts finalStr
	else
	    $stderr.puts "Client error"
	    exit 1
	end

    puts "String length is #{finalStr.length}"
end
