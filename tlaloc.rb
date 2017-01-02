#!/usr/bin/ruby

require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'getoptlong'


require_relative './forecast.rb'

def searchCity(city, debug)
    storePath='/tmp/README_nowcasting_prevision-immediate.txt'
    if ! File.exists?(storePath)
        puts "Downloading station list" if debug
        `lynx --dump http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt > #{storePath}`
    else
        puts "Not downloading station list, already got it" if debug
    end
    startAt = `grep -n 'Code des stations' #{storePath} | tail -n 1 | cut -d':' -f 1`.strip.to_i
    lineCount = `wc -l #{storePath} | cut -f 1`.strip.to_i
    tailArg = lineCount - startAt + 1
    if city.empty?
        matches = `tail -n #{tailArg} #{storePath}`.split("\n")
    else
        matches = `tail -n #{tailArg} #{storePath} | grep -i #{city}`.split("\n")
    end

    puts "You may enter:" if matches.count > 0
    matches.each { |m|
        code, number, name, lat, long = m.gsub(/\s+/m, ' ').strip.split(" ")
        puts "#{code} for #{name}"
    }
end

def fileOK(path, minLines)
    return ((File.exists?(path)) and (`wc -l "#{path}"`.strip.split(' ')[0].to_i > minLines))
end

### BEGIN SCRIPT ###############################################################

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ '--city', '-c', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--twitter', '-t', GetoptLong::NO_ARGUMENT ],
  [ '--debug', '-d', GetoptLong::NO_ARGUMENT ],
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
        puts "[-c|--city {$city}] EC code of the city in question (or search city list).  See later half of http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt"
        puts "[-t|--twitter] Push output to twitter"
        puts "[-d|--debug] Debug mode.  Don't push to twitter, print data output."
        puts "[-h|--help] Show this help screen"
        exit 1
  end
end


puts DateTime.now.rfc2822 if twitter

### Get data #########################################################


### Determine date time of last refresh
minuteOfCache = 27
dataLocation = '/tmp/tlaloc.ecData.txt'
minLines = 21120 * 0.9
n = DateTime.now
refreshECdata = false
reason = ''
if fileOK(dataLocation, minLines)
    lastRefreshWasAt = File.stat(dataLocation).mtime
    lastRefreshShouldBeAt = DateTime.new(n.year, n.month, n.day, n.hour, minuteOfCache, 0, (lastRefreshWasAt.utc_offset/60/60).to_s)
    lastRefreshShouldBeAt -= 1.0/24 if lastRefreshShouldBeAt > n
    lastRefreshShouldBeAt -= 1.0/60/24
    refreshECdata = lastRefreshWasAt < lastRefreshShouldBeAt
    reason = "cache dated #{lastRefreshWasAt.rfc2822} is #{refreshECdata ? 'before' : 'after'} #{lastRefreshShouldBeAt.rfc2822}"
else
    refreshECdata = true
    reason = "file does not exist"
end


# Fetch data if necessary
if refreshECdata
    puts "Refreshing cache because #{reason}" if (debug or twitter)
    urlBase='http://dd.weather.gc.ca/nowcasting/matrices/?C=M;O=A'
    fileURL=`lynx --dump '#{urlBase}' | tail -n 1 | cut -d ' ' -f 4`.chomp
    `curl -s #{fileURL} | gzip -dc > #{dataLocation}`
else
    puts "Not refreshing cache because #{reason}" if (debug or twitter)
end

#### Now get the data for your city
data = `cat #{dataLocation} | grep #{city} -A 28`
if data.nil? or data.empty?
    puts $stderr.puts "No EC data for #{city}"
    searchCity(city, debug)
    exit 1
elsif data.split("\n").count > 29
    searchCity(city, debug)
    puts $stderr.puts "More than one city"
    exit 1
end

puts "Data on data:" if debug
puts data if (debug or twitter)
puts data.split("\n").count if debug


### Get sunset times #################################################


## Get sunset at
## http://www.cmpsolv.com/cgi-bin/sunset?loc=YOW

## Eventually this should be replaced by scanning http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt
## and use https://github.com/joeyates/ruby-sun-times to calculate

# First store the file if it's a new day
sunsetLocationCache = "/tmp/tlaloc.sunset.#{city}.html"
minLines = 60*0.9
if ! fileOK(sunsetLocationCache, minLines) or File.stat(sunsetLocationCache).mtime < DateTime.now.beginning_of_day()
    puts "Refreshing sunset times for #{city}" if (debug or twitter)
    `curl -s http://www.cmpsolv.com/cgi-bin/sunset?loc=#{city} > #{sunsetLocationCache}`
else
    puts "Not refereshing sunset times for #{city}" if (debug or twitter)
end

# Get the sunset time from the cached file
sunsetStr=`cat #{sunsetLocationCache} | grep 'Sunset:'`.strip
if sunsetStr.split(' ').last.nil?
    puts $stderr.puts "No sunset data for #{city}"
    exit 1
end
sunset = sunsetStr.split(' ').last.strip




### Process data into forecasts objects ##############################

# Keep 7th line of data (12th line of output) until the time is 2 AM Zulu
currentLine=data.split("\n")[11]

current = Forecast.new(currentLine)

forecastStrings=data.split("\n")

forecasts = forecastStrings[11..forecastStrings.size-1].map { |l|
    next if l[0] == '-'
    Forecast.new(l)
}.compact



### Calculate worst cases ############################################

maxPop=forecasts.max_by {|f|
    f.pop
}.pop

minWindChill=forecasts.min_by {|f| f.windChill}.windChill

minTempFc=forecasts.min_by {|f| f.temp}
minTemp = minTempFc.temp

isThereWindChill = current.windChill? || minTempFc.windChill?

untilDateTime=(forecasts.max_by {|f| f.dateTime}.dateTime) + 1*60*60
untilHour=untilDateTime.hour



### Decide on string #################################################

windChillLabel = minTemp < 10 ? 'Windchill' : 'Temperature'

bodyStr="Current/Worst: #{windChillLabel}: #{current.windChill}/#{minWindChill}, POP: #{current.pcpType}/#{maxPop}; Sunset: #{sunset}\n"


# POP string
popStr=''
i=0
forecasts.each { |f|
    if f.pop >= 30
        i += 1
        if i==1
            popStr += "POP: #{f.hour}:00: #{f.pop}%; "
        else
            popStr += "#{f.hour}: #{f.pop}; "
        end
    end
}

windStr = ''
windTimes = ''
finalStr = bodyStr


### Decide on string if twitter ######################################
i=0
if twitter
    if $clientConf[city].nil?
        $stderr.puts "No configuration for city #{city}, can't announce"
        exit 1
    end

    weatherHashTag  = $clientConf[city]['weatherHashTag']
    bikeHashTag     = $clientConf[city]['bikeHashTag']

    twitterMaxChars = 140
    finalStr = '#' * (twitterMaxChars + 10)
    attempt=0

    while(finalStr.length >= 140)
        puts "#{finalStr.length} chars: #{finalStr}" if debug
        attempt+=1

        case attempt
        when 1
            announceStr = "Your #{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%k:%M').strip}: "
        when 2
            announceStr = "#{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%k:%M').strip}: "
        when 3
            announceStr = "#{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%l%P').strip}: "
        when 4
            popStr.strip!
            popStr.gsub!(/;$/, '')
        when 5
            windTimes = ''
        when 6
            windStr = ''
        when 10
	        popStr=''
		    forecasts.each { |f|
                finalStr = announceStr + bodyStr + windStr + popStr + windTimes
	            strLength = finalStr.length
			    if f.pop >= 30
			        i += 1
			        if i==1
			            popStr += "POP > 30% @ #{f.hour}:00"
			        elsif strLength < twitterMaxChars - 5
			            popStr += ", #{f.hour}"
	                else
	                    popStr += '+'
	                    break
			        end
		        end
	        }
        when 20
            windChillLabel = minTemp < 10 ? 'Wc' : 'T'
	        bodyStr="Current/Worst: #{windChillLabel}: #{current.windChill}/#{minWindChill}, P: #{current.pcpType}/#{maxPop}; S: #{sunset}\n"
        when 100
            finalStr = finalStr[0,twitterMaxChars-1]
        end


        finalStr = announceStr + bodyStr + windStr + popStr + windTimes

    end

else
    finalStr = bodyStr + windStr + popStr + windTimes
end



finalStr.strip!


### Ouput / publish ##################################################

unless twitter
    puts finalStr
else
	client = Twitter::REST::Client.new($clientConf[city])

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


