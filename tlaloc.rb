require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'getoptlong'


require_relative './models/prediction.rb'
require_relative './cache.rb'
require_relative './models/analysis.rb'
require_relative './models/location.rb'
require_relative './models/sources/nowcasting.rb'
require_relative './models/channels/twitter.rb'
require_relative './models/channels/cli.rb'

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


cityCode='CYOW'
twitter=false
$debug=false

opts.each do |opt, arg|
  case opt
    when '--city'
        cityCode=arg
    when '--twitter'
        require_relative './conf/twitterConfig.rb'
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

sunset = location.sunset

### Process data into prediction objects ##############################

current, forecasts = Nowcasting::createPredictions(data, location)

### Calculate worst cases by feeding to an analysis #################

a = Analysis.new(current, forecasts)

### Decide on string if twitter ######################################

# REARCH: This logic would all go in the twitter channel, most likely


channel = CliChannel.new(a)
if twitter
    channel = TwitterChannel.new(a)
#    if $clientConf[cityCode].nil?
#        $stderr.puts "No configuration for city #{cityCode}, can't announce"
#        exit 1
#    end
#
#    weatherHashTag  = $clientConf[cityCode]['weatherHashTag']
#    bikeHashTag     = $clientConf[cityCode]['bikeHashTag']
#
#    twitterMaxChars = 140
#    finalStr = '#' * (twitterMaxChars + 10)
#    attempt=0
#
#    while(finalStr.length >= 140)
#        puts "#{finalStr.length} chars: #{finalStr}" if $debug
#        attempt+=1
#
#        case attempt
#        when 1
#            announceStr = "Your #{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%k:%M').strip}: "
#        when 2
#            announceStr = "#{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%k:%M').strip}: "
#        when 3
#            announceStr = "#{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%l%P').strip}: "
#        when 4
#            popStr.strip!
#            popStr.gsub!(/;$/, '')
#        when 5
#            windTimes = ''
#        when 6
#            windStr = ''
#        when 10
#	        popStr=''
#		    forecasts.each { |f|
#                finalStr = announceStr + bodyStr + windStr + popStr + windTimes
#	            strLength = finalStr.length
#			    if f.pop >= 30
#			        i += 1
#			        if i==1
#			            popStr += "POP > 30% @ #{f.hour}:00"
#			        elsif strLength < twitterMaxChars - 5
#			            popStr += ", #{f.hour}"
#	                else
#	                    popStr += '+'
#	                    break
#			        end
#		        end
#	        }
#        when 20
#            windChillLabel = minTemp < 10 ? 'Wc' : 'T'
#	        bodyStr="Current/Worst: #{windChillLabel}: #{current.windChill}/#{minWindChill}, P: #{current.pcpType}/#{maxPop}; S: #{sunset}\n"
#        when 100
#            finalStr = finalStr[0,twitterMaxChars-1]
#        end
#
#
#        finalStr = announceStr.chomp + "\n" + bodyStr.chomp + "\n" + windStr + popStr + windTimes
#
#    end
#
end



### Ouput / publish ##################################################


# REARCH: Goes in channel or broadcast class

puts a.to_s if $debug and not twitter

channel.publish
