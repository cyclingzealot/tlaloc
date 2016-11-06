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
        puts "[-h|--help] Show this help screen"
        exit 1
  end
end


# Get the last file of http://dd.weather.gc.ca/nowcasting/matrices/
urlBase='http://dd.weather.gc.ca/nowcasting/matrices/'

fileURL=`lynx --dump #{urlBase} | tail -n 1 | cut -d ' ' -f 4`.chomp

data=`curl -s #{fileURL} | gzip -dc | grep #{city} -A 28`

data.split("\n").each {|l| puts l} if debug

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

untilHour=forecasts.max_by {|f| f.dateTime}.hour


## Get sunset at
## http://www.cmpsolv.com/cgi-bin/sunset?loc=YOW
sunsetStr=`curl -s http://www.cmpsolv.com/cgi-bin/sunset?loc=#{city} | grep 'Sunset:'`.strip
sunset = sunsetStr.split(' ').last.strip

announceStr="Current/Worst: Windchill: #{current.windChill}/#{minWindChill}, POP: #{current.pcpType}/#{maxPop}; Sunset: #{sunset}\n"

popStr=''
i=0
forecasts.each { |f|
    if f.pop >= 30
        i += 1
        if i==1
            popStr = "#{f.hour}:00: #{f.pop}%; "
        else
            popStr = "#{f.hour}: #{f.pop}; "
        end
    end
}

i=0
if twitter
    announceStr = "Your #ottbike #ottweather until #{untilHour}:59: " + announceStr

	if (announceStr + popStr).length > 140
	    announceStr="Current/Worst: Wc: #{current.windChill}/#{minWindChill}, P: #{current.pcpType}/#{maxPop}; S: #{sunset}\n"
	    announceStr = "#ottbike #ottweather until #{untilHour}:59: " + announceStr
	    forecasts.each { |f|
		    if f.pop >= 30
		        i += 1
		        if i==1
		            popStr = "POP > 30%: #{f.hour}:00"
		        else
		            popStr = "; #{f.hour}"
		        end
	        end
	    }
	end

end


announceStr += popStr
announceStr.strip!

unless twitter
    puts announceStr
else
	client = Twitter::REST::Client.new($clientConf)

	if client
	   puts "Client ready"
       unless debug
        r = client.update(announceStr)

        if ! r.nil?
            puts "Announced!"
            puts r.url
        else
            puts "Annouced failed"
        end
       else
        puts "Debug on, not announcing"
       end
       puts announceStr
	else
	    $stderr.puts "Client error"
	    exit 1
	end
end




