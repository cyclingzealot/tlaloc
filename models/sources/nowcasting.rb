require_relative '../../conf/cacheConf.rb'

########################################################################
# Parses the Nowcasting matrices at http://dd.weather.gc.ca/nowcasting/matrices/
# TODO: Make the ruby equivalent of an interface called "Sources"
########################################################################
class Nowcasting


    DATA_LOCATION = 'http://dd.weather.gc.ca/nowcasting/matrices/?C=M;O=A'
    FILE_LOCATION = $cacheConf['matrixList']['fileLocation']


    def self.refreshData()
        if $devOffLine.nil? or $devOffLine == false
            urlBase=Nowcasting::DATA_LOCATION
            fileURL=`lynx --dump '#{urlBase}' | tail -n 1 | cut -d ' ' -f 4`.chomp
            `curl -s #{fileURL} | gzip -dc > #{Nowcasting::FILE_LOCATION}`
        end
    end


    def self.getDataForCity(cityCode)
        c = Cache.new('matrixList')

        c.refreshIfRequired

        data = `cat #{Nowcasting::FILE_LOCATION} | grep #{cityCode} -A 28`
    end

    def self.createPredictions(data, location)
		# Take 7th line of data (12th line of output) for the line representing
		# current observation
		currentLine=data.split("\n")[11]
		
		current = Nowcasting::createPrediction(currentLine, location)
		
		forecastStrings=data.split("\n")
		
		forecasts = forecastStrings[11..forecastStrings.size-1].map { |l|
		    next if l[0] == '-'
		    Nowcasting::createPrediction(l, location)
		}.compact

        return current, forecasts
    end

    def self.createPrediction(line, location)
        parts = line.split('|')
        dateTimeStr = parts[0].strip

		p = Prediction.new(location, dateTimeStr)

        
        p.temp = parts[12].strip.to_i
        p.pcpType = parts[3].strip
        p.wind = parts[15].strip.to_i


        # TODO: Parse a time zone here?
        #p.dateTime = DateTime.strptime("#{dateTimeStr} #{tzOffsetStr}", "%Y%m%d %H%M %z")

        p.pcpType = 'none' if p.pcpType.nil? or p.pcpType.empty?

        ## Lets find the maximum POP of all 3 POP types
        p.pop = [
            #parts[4].strip.to_i,
            #parts[6].strip.to_i,
            #parts[8].strip.to_i,
            parts[9].strip.to_i,
        ].max
        
    end
end
