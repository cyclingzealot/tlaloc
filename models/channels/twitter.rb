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



    def generateString
	    weatherHashTag  = $clientConf[@cityCode]['weatherHashTag']
	    bikeHashTag     = $clientConf[@cityCode]['bikeHashTag']
	
	    twitterMaxChars = 280
	    finalStr = '#' * (twitterMaxChars + 10)
	    attempt=0

        untilDateTime = @analysis.untilDateTime

        analysisToStringsArray = @analysis.to_s.split("\n")
        bodyStr = analysisToStringsArray[0]
        popStr = analysisToStringsArray[1] or ''
        windStr = ''
        windTimes = ''
	
	    while(finalStr.length >= twitterMaxChars)
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
                forecasts = @analysis.allPredictions
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
	
	        finalStr = (announceStr.chomp + "\n" + bodyStr.chomp + "\n" + windStr + popStr + windTimes).strip
        end

        return finalStr
    end
end
