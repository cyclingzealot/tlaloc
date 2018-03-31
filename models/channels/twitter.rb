require_relative './channel.rb'

class TwitterChannel < Channel

	attr_reader :cityCode

    def initialize(analysis)
		@cityCode = analysis.location.code
	    if $clientConf[@cityCode].nil?
	        msg = "No configuration for city #{@cityCode}, can't announce"
			$stderr.puts msg
	        raise msg
	    end
        super(analysis)
    end

    def publish()
        str = generateString
        self.broadcast(str)
	end


    def broadcast(finalStr)
	    client = Twitter::REST::Client.new($clientConf[cityCode])

	    if client
	       puts "Client ready"
	       unless $debug or $devOffLine
	         r = client.update(finalStr)

	         if ! r.nil?
	            puts "Announced!"
	            puts r.url
	         else
	            puts "Annouced failed"
	         end
	      else
	         puts "$debug or $devOffLine on, not announcing"
	      end
	      puts finalStr
	    else
	        $stderr.puts "Client error"
	        exit 1
	    end

	    puts "String length is #{finalStr.length}"
    end



    def generateString
	    weatherHashTag  = $clientConf[@cityCode]['weatherHashTag']
	    bikeHashTag     = $clientConf[@cityCode]['bikeHashTag']

	    twitterMaxChars = 280
	    finalStr = '#' * (twitterMaxChars + 10)
	    attempt=0

        untilDateTime = @analysis.untilDateTime

        tmpStr = @analysis.tmpStr
        popSumStr = @analysis.popSumStr
        popStr = @analysis.popTimesStr
        sunsetStr = @analysis.sunsetStr
        gustStr = @analysis.gustStr
        windStr = @analysis.windStr
        windTimes = ''

	    while(finalStr.length >= twitterMaxChars)
	        puts "#{finalStr.length} chars: #{finalStr}" if $debug
	        attempt+=1

	        case attempt
	        when 1
	            announceStr = "Your #{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%k:%M').strip} "
                announceStr = announceStr.chomp + "(Current / Worst):"
	        when 2
	            announceStr = "#{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%k:%M').strip} "
                announceStr = announceStr.chomp + "(Current / Worst):"
	        when 3
	            announceStr = "#{bikeHashTag} #{weatherHashTag} until #{untilDateTime.strftime('%l%P').strip} "
                announceStr = announceStr.chomp + "(Current / Worst):"
	        when 4
	            popStr.strip!
	            popStr.gsub!(/;$/, '')
	        when 5
	            windTimes = ''
	        when 6
	            windStr = ''
	        when 10
		        popStr=''
                forecasts = @analysis.allPredictions
			    forecasts.each { |f|
	                finalStr = announceStr + tmpStr + windStr + popStr + windTimes
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
	        when 100
	            finalStr = finalStr[0,twitterMaxChars-1]
	        end

	        finalStr = [announceStr, tmpStr, popSumStr,  popStr, windStr, gustStr, sunsetStr, windTimes].map{|s| s.strip}.select{|s| not s.empty?}.join("\n").gsub(/[\r\n]{2}/, "\n").strip if attempt < 100
        end

        return finalStr
    end
end
