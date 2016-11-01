

class Forecast

    @temp = nil
    @wind = nil
    @pcpType = nil
    @pop     = nil
    @hour   = nil

    def initialize(line)
    # From the 7th line (current), record the temperature (14th column T) and precipiration (5th column)
    # See http://dd.weather.gc.ca/nowcasting/doc/README_nowcasting_prevision-immediate.txt
        parts = line.split('|')
        @temp = parts[12].strip.to_i
        @pcpType = parts[3].strip
        @wind = parts[15].strip.to_i

        @hour = parts[0].strip.split(' ')[1].strip[0,2].to_i - 4

        @hour += 24 if @hour < 0

        @pcpType = 'none' if @pcpType.nil? or @pcpType.empty?

        ## Lets find the maximum POP of all 3 POP types
        @pop = [
            parts[4].strip.to_i,
            parts[6].strip.to_i,
            parts[8].strip.to_i,
        ].max
    end


    def windChill()
        return (13.12 + 0.6215*@temp - 11.37*@wind**0.16 + 0.3965*@temp*@wind**0.16).floor
    end

    def pop()
        return @pop
    end

    def temp()
        return @temp
    end

    def pcpType()
        return @pcpType
    end


end
