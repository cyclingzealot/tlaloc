require 'byebug'
require 'twitter'
require 'active_support/time'


class Forecast

    @temp = nil
    @wind = nil
    @pcpType = nil
    @pop     = nil
    @dateTime = nil
    @zone = nil

    def initialize(line)
        @zone = ActiveSupport::TimeZone.new("Eastern Time (US & Canada)")
    # From the 7th line (current), record the temperature (14th column T) and precipiration (5th column)
    # See http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt
        parts = line.split('|')
        @temp = parts[12].strip.to_i
        @pcpType = parts[3].strip
        @wind = parts[15].strip.to_i

        dateTimeStr = parts[0].strip
        @dateTime = DateTime.strptime("#{dateTimeStr} +0000", "%Y%m%d %H%M %z")

        @pcpType = 'none' if @pcpType.nil? or @pcpType.empty?


        ## Lets find the maximum POP of all 3 POP types
        @pop = [
            #parts[4].strip.to_i,
            #parts[6].strip.to_i,
            #parts[8].strip.to_i,
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

    def windChill?()
        return ! self.windChill() == @temp
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
        return @dateTime.in_time_zone(@zone)
    end

    def hour()
        return @dateTime.in_time_zone(@zone).hour
    end





end
