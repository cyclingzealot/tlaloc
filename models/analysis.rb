class Analysis

    attr_reader :futurePredictions
    attr_reader :currentPrediction

    attr_reader :humidexMax
    attr_reader :windMax
    attr_reader :gustMax
    attr_reader :maxPop
    attr_reader :windChillMin
    attr_reader :temperatureMin
    attr_reader :temperatureMax
    attr_reader :popMax

    attr_reader :untilDateTime

    def initialize(currentPrediction, futurePredictions)
        # Doublecheck location of predictions against currentPrediction
        raise "Not all predictions from same location" if ! futurePredictions.all? { |p|
            p.location == currentPrediction.location
        }

        @currentPrediction = currentPrediction
        @futurePredictions = futurePredictions

        self.calcWorstCases()
    end

    def allPredictions
        [@currentPrediction] + @futurePredictions
    end

    def location
        @currentPrediction.location
    end

    def calcWorstCases()
		@popMax=self.allPredictions.max_by {|f|
		    f.pop
		}.pop

        @windMax = self.allPredictions.max_by {|f| f.wind}.wind
        @gustMax = self.allPredictions.max_by {|f| f.gust}.gust
		@windChillMin=self.allPredictions.min_by {|f| f.windChill}.windChill

		@temperatureMin = self.allPredictions.min_by {|f| f.temp}.temp
		@temperatureMax = self.allPredictions.max_by {|f| f.temp}.temp

		@untilDateTime=(@futurePredictions.max_by {|f| f.dateTime}.dateTime) + 1*60*60
    end

    def untilHour
        @untilDateTime.hour
    end

    def worstTemp
        return @temperatureMax if @windChillMin >= 20
        return @windChillMin
    end

    def gustStr
        "Gusts: #{@currentPrediction.gust}/#{@gustMax}\n"
    end

    def windStr
        windStr="Wind: #{@currentPrediction.wind}/#{@windMax}\n"
    end

    def sunsetStr
        "Sunset: #{self.sunset().strftime("%H:%M")}\n"
    end

    def popSumStr
        "POP: #{@currentPrediction.pcpType}/#{@popMax}"
    end

    def tmpStr
        "#{windChillLabel}: #{@currentPrediction.windChill()}/#{self.worstTemp()}"
    end

    def windChillLabel
        @windChillMin < 10 ? 'Windchill' : 'Temperature'
    end

    def popTimesStr
        popStr=''
        i=0
        ([@currentPrediction] + @futurePredictions).each { |f|
            if f.pop >= 30
                i += 1
                if i==1
                    popStr += "POP: #{f.hour}:00: #{f.pop}%; "
                else
                    popStr += "#{f.hour}: #{f.pop}; "
                end
            end
        }
        popStr
    end

    def to_s

        # Get the POP for each prediction (including the current one) and develop it into a string

        windTimes = ''

        # COuld be refactored into a common fuctnion called assembleStrings?
        [tmpStr.strip, popSumStr.strip, windStr.strip, gustStr.strip, popTimesStr.strip,  sunsetStr.strip].select {|s| not s.empty?}.join("\n").strip
    end


    def sunset
        require 'active_support/core_ext/time'
        where = @currentPrediction.location
        where.sunset.in_time_zone(where.timezone)
    end

end
