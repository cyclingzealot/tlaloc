require 'sun_times'
require 'date'

class Location
    @latitude
    @longitude
    @code
    @name
    @timezone

    DATA_LOCATION = 'http://dd.meteo.gc.ca/nowcasting/doc/README_INCS-SIPI.txt'



    def self.searchCity(city)
        c = Cache.new('cityList')
        c.refreshIfRequired()
        storePath = c.getFileLocation()
        startAt = `grep -n 'Code des stations' #{storePath} | tail -n 1 | cut -d':' -f 1`.strip.to_i
        lineCount = `wc -l #{storePath} | cut -f 1`.strip.to_i
        tailArg = lineCount - startAt + 1
        if city.empty?
            matches = `tail -n #{tailArg} #{storePath}`.split("\n")
        else
            matches = `tail -n #{tailArg} #{storePath} | grep -i #{city}`.split("\n")
        end

        puts "You may enter:" if matches.count > 0
        matches.each { |m|
            code, number, name, lat, long = m.gsub(/\s+/m, ' ').strip.split(" ")
            puts "#{code} for #{name}"
        }
    end

    def self.refreshData(dataLocation, fileLocation)
        `lynx --dump #{dataLocation} > #{fileLocation}`
    end


    def sunrise()
        SunTimes.new.rise(Date.today, @latitude, @longitude)
    end


    def sunset()
        SunTimes.new.set(Date.today, @latitude, @longitude)
    end
end
