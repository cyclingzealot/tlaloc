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

    def initialize(currentPrediction, futurePredictions, location)
        @currentPrediction = currentPrediction
        @futurePredictions = futurePredictions
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



end
