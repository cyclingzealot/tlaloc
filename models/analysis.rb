class Analysis

    attr_reader :futurePredictions
    attr_reader :currentPrediction

    attr_reader :humidexMax
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
        [@currentPrediction] + [@futurePredictions]
    end

    def location
        @currentPrediction.location
    end

    def calcWorstCases()
		@popMax=@futurePredictions.max_by {|f|
		    f.pop   
		}.pop
		
		@windChillMin=@futurePredictions.min_by {|f| f.windChill}.windChill
		
		@temperatureMin = @futurePredictions.min_by {|f| f.temp}.temp
		@temperatureMax = @futurePredictions.max_by {|f| f.temp}.temp 
		
		@untilDateTime=(@futurePredictions.max_by {|f| f.dateTime}.dateTime) + 1*60*60 
    end

    def untilHour
        @untilDateTime.hour
    end

    def worstTemp
        return @temperatureMax if @windChillMin >= 20
        return @windChillMin
    end

    def to_s
        windChillLabel = @windChillMin < 10 ? 'Windchill' : 'Temperature'
        bodyStr="Current/Worst: #{windChillLabel}: #{@currentPrediction.windChill()}/#{@windChillMin}, POP: #{@currentPrediction.pcpType}/#{@popMax}; Sunset: #{self.sunset().strftime("%H:%M")}\n"

        # Get the POP for each prediction (including the current one) and develop it into a string
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

        windStr = ''
        windTimes = ''

        (bodyStr.chomp + "\n" + popStr.chomp).chomp
    end


    def sunset
        require 'active_support/core_ext/time'
        where = @currentPrediction.location
        where.sunset.in_time_zone(where.timezone)
    end

end
