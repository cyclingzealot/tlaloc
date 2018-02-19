require 'sun_times'
require 'date'
require_relative '../conf/cacheConf.rb'
require 'timezone'


class Location
    attr_reader :latitude
    attr_reader :longitude
    attr_reader :code
    attr_reader :name
    attr_reader :timezone

    DATA_LOCATION = $cacheConf['cityList']['dataLocation']


    def initialize(code, name, lat, long, skipTZ = FALSE)
        @code = code
        @name = name
        @latitude = lat.to_f
        @longitude = long.to_f


        @timezone = Timezone::Zone.new(:latlong => [@latitude, @longitude])
    end

    def getCode
        @code
    end

    def getName
        @name
    end

    def self.searchCity(city)
        cities = Location.createLocations(city, true)

        puts "You may enter:" if cities.count > 0
        cities.each {|code,loc|
            puts "#{code} for #{loc.getName}"
        }
    end


    ### Reads the entre city list and returns an array of locations with their
    ### code, name and lat long
    def self.createLocations(cityCode, skipTZ = false)
        c = Cache.new('cityList')
        c.refreshIfRequired()
        storePath = c.getFileLocation()
        startAt = `grep -n 'Code des stations' #{storePath} | tail -n 1 | cut -d':' -f 1`.strip.to_i
        lineCount = `wc -l #{storePath} | cut -f 1`.strip.to_i
        tailArg = lineCount - startAt + 1
        if cityCode.empty?
            matches = `tail -n #{tailArg} #{storePath}`.split("\n")
        else
            matches = `tail -n #{tailArg} #{storePath} | grep -i #{cityCode}`.split("\n")
        end

        cities = {}
        matches.each { |m|
            code, syn, name, lat, long = m.gsub(/\s+/m, ' ').strip.split(" ")
            cities[code] = (Location.new(code,name,lat,long,skipTZ))
        }

        return cities
    end

    def self.refreshData(dataLocation, fileLocation)
        if $devOffLine == true
            `cp $PWD/dataSamples/dd.weather.gc.ca/nowcasting/doc/README_INCS-SIPI.txt #{fileLocation}`
        else
            `lynx --dump #{dataLocation} > #{fileLocation}`
        end
    end

    def getCoordinates

    end


    def sunrise()
        SunTimes.new.rise(Date.today, @latitude, @longitude)
    end


    def sunset()
        SunTimes.new.set(Date.today, @latitude, @longitude)
    end
end
