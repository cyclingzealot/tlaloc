require 'byebug'
require 'twitter'


class Forecast

    @temp = nil
    @wind = nil
    @pcpType = nil
    @pop     = nil
    @dateTime = nil

    def initialize(line)
    # From the 7th line (current), record the temperature (14th column T) and precipiration (5th column)
    # See http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt
        parts = line.split('|')
        @temp = parts[12].strip.to_i
        @pcpType = parts[3].strip
        @wind = parts[15].strip.to_i

        hourNum = parts[0].strip.split(' ')[1].strip[0,2].to_i
        n = DateTime.now
        @dateTime = DateTime.new(n.year, n.month, n.day, hourNum, n.minute, n.second)
        @dateTime -= 4/24

        @pcpType = 'none' if @pcpType.nil? or @pcpType.empty?


        ## Lets find the maximum POP of all 3 POP types
        @pop = [
            parts[4].strip.to_i,
            parts[6].strip.to_i,
            parts[8].strip.to_i,
            parts[9].strip.to_i,
        ].max

        #debugger
        #nil
    end


    def windChill()
        # See https://en.wikipedia.org/wiki/Wind_chill#North_American_and_United_Kingdom_wind_chill_index
        if (@temp <= 10 and @wind > 4.8)
            return [(13.12 + 0.6215*@temp - 11.37*@wind**0.16 + 0.3965*@temp*@wind**0.16).round, @temp].min
        else
            return @temp
        end
    end

    def pop()
        return @pop
    end

    def temp()
        return @temp
    end

    def wind()
        return @wind
    end

    def pcpType()
        return @pcpType
    end

    def dateTime()
        return @dateTime
    end

    def hour()
        return @dateTime.hour
    end


end
