require 'sun_times'
require 'date'
require_relative '../conf/cacheConf.rb'
require 'timezone'


class Location
    attr_reader :latitude
    attr_reader :longitude
    attr_reader :code
    attr_reader :name

    # Path of local copy of EC location file
    DATA_LOCATION = $cacheConf['cityList']['dataLocation']

    # CSV file that includes timezone data and hopefully will replace the above one day
    CSV_LOCATION = File.expand_path('~/.tlaloc.locationData.tsv')
    CSV_OPTIONS = {col_sep: "\t", row_sep: "\n", headers: true, encoding: "UTF-8", header_converters: :symbol}

    CSV_HEADER_TZ = "timezonename"

    # TODO: Find how to do a class, static variable for this (a variable that all locations can access and retains it's value)
    $csvLocationData = nil


    def initialize(code, name, lat, long, skipTZ = FALSE)
        @code = code
        @name = name
        @latitude = lat.to_f
        @longitude = long.to_f


    end

    def timezone()
        begin
            @timezone or @timezone = Location::findTimeZone(@code) #Timezone.lookup(@latitude, @longitude)
        rescue Timezone::Error::InvalidZone
            puts "Invalid zone for #{self.to_s}"
            raise
        end
    end

    def self.findTimeZone(locationCode)
        locationDataHash = Location::readLocationData
        return locationDataHash[locationCode][Location::CSV_HEADER_TZ.to_sym]
    end

    ########################################################################
    # Generate a string that contains all the timezone data per city code
    # Also save that data to tsv file
    ########################################################################
    def self.updateTimeZoneData(seperator = "\t")
        Location::configureTimeZoneLookup()
        locations = Location::createLocations('')
        existingLocations = Location::readLocationData()
        str = ''
        i=0
        locations.each { |locationCode, locObj |
            i += 1
            next if locObj.latitude == 0.0 

            # Check if we genuinely have a location object
            if locObj.nil? 
                $stderr.puts "Nil location object for #{locationCode}"
                puts
                next
            end

            if not existingLocations[locObj.code].nil?
                puts "Already have:\t#{locObj.to_s}"
                next
            end


            print "#{i} / #{locations.count}: #{locObj.to_s} "
            print "Fetching... "

            begin
                str += (locationCode + seperator + locObj.timezone.name).chomp + "\n"
            rescue Timezone::Error::InvalidZone
                sleep 1
                next
            end

            print "Obtained... "
            self.appendLocationData(locObj)
            puts "Saved."
            sleep 1
        }

        return str
    end

    def to_s
        "#{@code}: #{@name} (#{@latitude}; #{@longitude})"
    end

    def self.readLocationData()
        require 'csv'
        returnHash = {}
        if $csvLocationData.nil?
	        if File.file?(Location::CSV_LOCATION)
	            CSV.foreach(Location::CSV_LOCATION, Location::CSV_OPTIONS) do |row|
	                rowHash = row.to_hash
	                returnHash[rowHash[:code]] = rowHash
	            end
	        end
            $csvLocationData = returnHash.clone
        else
            returnHash = $csvLocationData
        end

        return returnHash
    end

    def self.appendLocationData(locObj)
        require 'csv'

        # If the file does not exist, create it with headers
        if not File.file?(Location::CSV_LOCATION)
            CSV.open(Location::CSV_LOCATION, "w", Location::CSV_OPTIONS) do |csv|
                csv << ["code", Location::CSV_HEADER_TZ, "latitude", "longitude"]
            end
        end

        # Append the last bit of location data
        CSV.open(Location::CSV_LOCATION, "a+", Location::CSV_OPTIONS) do |csv|
            csv << [locObj.code, locObj.timezone.name, locObj.latitude, locObj.longitude, locObj.name]
        end
    end

    ########################################################################
    # Test if the timezone lookup has been configured. 
    # If not, catches the error and returns false
    ########################################################################
    def self.timeZoneLookupReady?()
        begin
            Location::testTimeZoneLookup
            # TODO: What if the above returns false?  Name of test time zone has changed.
        rescue Timezone::Error::InvalidConfig
            return false
        end
    end


    ########################################################################
    # Configures the time zone lookup IF not already set up
    ########################################################################
    def self.configureTimeZoneLookup
        if not Location::timeZoneLookupReady?()
            require_relative '../conf/timezoneGoogleApiConf.rb'
            Timezone::Lookup.config(:google) do |c|
                c.api_key = $googleAPIkey
                c.open_timeout = 60
                c.read_timeout = 60
            end
        end
    end

    ########################################################################
    # Returns true if the location is working correctly
    ########################################################################
    def self.testTimeZoneLookup
        Timezone.lookup(-34.92771808058, 138.477041423321).name == "Australia/Adelaide"
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
