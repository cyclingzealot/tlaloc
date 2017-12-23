require 'sun_times'
require 'date'
require_relative '../conf/cacheConf.rb'
require 'timezone'


class Location
    @latitude
    @longitude
    @code
    @name
    @timezone

    DATA_LOCATION = $cacheConf['cityList']['dataLocation']


    def initialize(code, name, lat, long, skipTZ = FALSE)
        @code = code
        @name = name
        @latitude = lat
        @longitude = long

        @timezone = Timezone::Zone.new(:latlong => [@latitude, @longitude])
    end

    def self.searchCity(city)
        cities = Location.createCities(city, TRUE)

        puts "You may enter:" if cities.count > 0
        cities.each {|c|
            puts "#{c.code} for #{c.name}"
        }
    end


    def self.createLocation(cityCode, skipTZ=false)
        self.createLocations(skipTZ)[cityCode]
    end


    ### Reads the entre city list and returns an array of locations with their
    ### code, name and lat long
    def self.createLocations(skipTZ = false)
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

        cities = {}
        matches.each { |m|
            code, syn, name, lat, long = m.gsub(/\s+/m, ' ').strip.split(" ")
            cities[code] = (Location.new(code,name,lat,long,skipTZ))
        }

        return cities
    end

    def self.refreshData(dataLocation, fileLocation)
        `lynx --dump #{dataLocation} > #{fileLocation}`
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
