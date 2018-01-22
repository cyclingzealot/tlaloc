require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'getoptlong'


require_relative './models/forecast.rb'
require_relative './cache.rb'
require_relative './models/location.rb'
require_relative './models/sources/nowcasting.rb'


def fileOK(path, minLines)
    return ((File.exists?(path)) and (`wc -l "#{path}"`.strip.split(' ')[0].to_i > minLines))
end

### BEGIN SCRIPT ###############################################################

opts = GetoptLong.new(
  [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
  [ '--city', '-c', GetoptLong::REQUIRED_ARGUMENT ],
  [ '--twitter', '-t', GetoptLong::NO_ARGUMENT ],
  [ '--$debug', '-d', GetoptLong::NO_ARGUMENT ],
)


cityCode='YOW'
twitter=false
$debug=false

opts.each do |opt, arg|
  case opt
    when '--city'
        cityCode=arg
    when '--twitter'
        require_relative './twitterConfig.rb'
        twitter=true
    when '--$debug'
        $debug=true
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
#
#minuteOfCache = 27
#dataLocation = '/tmp/tlaloc.ecData.txt'
#minLines = 21120 * 0.9
#n = DateTime.now
#refreshECdata = false
#reason = ''
#if fileOK(dataLocation, minLines)
#    lastRefreshWasAt = File.stat(dataLocation).mtime
#    lastRefreshShouldBeAt = DateTime.new(n.year, n.month, n.day, n.hour, minuteOfCache, 0, (lastRefreshWasAt.utc_offset/60/60).to_s)
#    lastRefreshShouldBeAt -= 1.0/24 if lastRefreshShouldBeAt > n
#    lastRefreshShouldBeAt -= 1.0/60/24
#    refreshECdata = lastRefreshWasAt < lastRefreshShouldBeAt
#    reason = "cache dated #{lastRefreshWasAt.rfc2822} is #{refreshECdata ? 'before' : 'after'} #{lastRefreshShouldBeAt.rfc2822}"
#else
#    refreshECdata = true
#    reason = "file does not exist"
#end

# Fetch data if necessary
#if refreshECdata
#    puts "Refreshing cache because #{reason}" if ($debug or twitter)
#    urlBase='http://dd.weather.gc.ca/nowcasting/matrices/?C=M;O=A'
#    fileURL=`lynx --dump '#{urlBase}' | tail -n 1 | cut -d ' ' -f 4`.chomp
#    `curl -s #{fileURL} | gzip -dc > #{dataLocation}`
#else
#    puts "Not refreshing cache because #{reason}" if ($debug or twitter)
#end

#### Now get the data for your cityCode
data = Nowcasting.getDataForCity(cityCode)
location = nil
if data.nil? or data.empty?
    puts $stderr.puts "No EC data for #{cityCode}"
    Location.searchCity(cityCode)
    exit 1
elsif data.split("\n").count > 29
    puts $stderr.puts "More than one city"
    Location.searchCity(cityCode)
    exit 1
else
    locations = Location.createLocations(cityCode)
    location = locations.first[1]
end

puts "Data on data:" if $debug
puts data if ($debug or twitter)
puts data.split("\n").count if $debug


### Get sunset times #################################################


## Get sunset at
## http://www.cmpsolv.com/cgi-bin/sunset?loc=YOW

## Eventually this should be replaced by scanning http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt
## and use https://github.com/joeyates/ruby-sun-times to calculate

# First store the file if it's a new day
#sunsetLocationCache = "/tmp/tlaloc.sunset.#{city}.html"
#minLines = 60*0.9
#if ! fileOK(sunsetLocationCache, minLines) or File.stat(sunsetLocationCache).mtime < DateTime.now.beginning_of_day()
#    puts "Refreshing sunset times for #{city}" if ($debug or twitter)
#    `curl -s http://www.cmpsolv.com/cgi-bin/sunset?loc=#{city} > #{sunsetLocationCache}`
#else
#    puts "Not refereshing sunset times for #{city}" if ($debug or twitter)
#end
#
## Get the sunset time from the cached file
#sunsetStr=`cat #{sunsetLocationCache} | grep 'Sunset:'`.strip
#sunset = 'n/a'
#if sunsetStr.split(' ').last.nil?
#    puts $stderr.puts "No sunset data for #{city}" if $debug
#else
#    sunset = sunsetStr.split(' ').last.strip
#end

sunset = location.sunset


### Process data into forecasts objects ##############################
### RENDU ICI REARCH

# Take 7th line of data (12th line of output) for the line representing
# current observation
currentLine=data.split("\n")[11]

# REARCH TODO: change this into creator for a NowcastEntry or NowcastLine?
# Not sure about rearch, comme back to it later
current = Forecast.new(currentLine)

forecastStrings=data.split("\n")

forecasts = forecastStrings[11..forecastStrings.size-1].map { |l|
    next if l[0] == '-'
    Forecast.new(l)
}.compact



### Calculate worst cases ############################################

# REARCH TODO: This will be an anlysis
maxPop=forecasts.max_by {|f|
    f.pop
}.pop

minWindChill=forecasts.min_by {|f| f.windChill}.windChill

minTempFc=forecasts.min_by {|f| f.temp}
minTemp = minTempFc.temp
maxTempFc = forecasts.max_by {|f| f.temp}
maxTemp = maxTempFc.temp

isThereWindChill = current.windChill? || minTempFc.windChill?

untilDateTime=(forecasts.max_by {|f| f.dateTime}.dateTime) + 1*60*60
untilHour=untilDateTime.hour

worstTempOrChill = minWindChill
worstTempOrChill = maxTemp if minWindChill >= 20



### Decide on string #################################################


# REARCH: This would be an analysis interacting with a channel?

windChillLabel = worstTempOrChill < 10 ? 'Windchill' : 'Temperature'

bodyStr="Current/Worst: #{windChillLabel}: #{current.windChill}/#{worstTempOrChill}, POP: #{current.pcpType}/#{maxPop}; Sunset: #{sunset}\n"


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

# REARCH: This logic would all go in the twitter channel, most likely


i=0
if twitter
    if $clientConf[cityCode].nil?
        $stderr.puts "No configuration for city #{cityCode}, can't announce"
        exit 1
    end

    weatherHashTag  = $clientConf[cityCode]['weatherHashTag']
    bikeHashTag     = $clientConf[cityCode]['bikeHashTag']

    twitterMaxChars = 140
    finalStr = '#' * (twitterMaxChars + 10)
    attempt=0

    while(finalStr.length >= 140)
        puts "#{finalStr.length} chars: #{finalStr}" if $debug
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


# REARCH: Goes in channel or broadcast class

unless twitter
    puts finalStr
else
	client = Twitter::REST::Client.new($clientConf[cityCode])

	if client
	   puts "Client ready"
       unless $debug
         r = client.update(finalStr)

         if ! r.nil?
            puts "Announced!"
            puts r.url
         else
            puts "Annouced failed"
         end
      else
         puts "$debug on, not announcing"
      end
      puts finalStr
	else
	    $stderr.puts "Client error"
	    exit 1
	end

    puts "String length is #{finalStr.length}"
end


