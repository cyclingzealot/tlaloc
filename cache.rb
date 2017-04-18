

class Cache

    @fileLocation
    @dataLocation
    @refreshTimeShouldBe
    @minLines
    @confName

    NEVER = -1

    #Conf names
    CITY_LIST = 'cityList'
    NOWCASTING = 'matrixList'

    def self.loadConf
        require_relative 'conf/cacheConf.rb'
    end

    def self.fileOK(path, minLines)
        return ((File.exists?(path)) and (`wc -l "#{path}"`.strip.split(' ')[0].to_i > minLines))
    end

    def self.dirname(path)
        File.dirname(File.expand_path(path))
    end


    def initialize(confName)
        @confName = confName
        Cache.loadConf
        config = $cacheConf[confName]
        @dataLocation = config['dataLocation']
        @minLines = config['minLines']

        setRefreshTimeShouldBe(config['refresh'])

        setFileLocation(config, $cacheStore)
    end

    def setRefreshTimeShouldBe(refreshPolicy)
        if refreshPolicy == Cache::NEVER
            @refreshTimeShouldBe = Time.new(1971)
        else
            n = DateTime.now
            lastRefreshWasAt = File.stat(@dataLocation).mtime
            @refreshTimeShouldBe = DateTime.new(n.year, n.month, n.day, n.hour, refreshPolicy, 0, (lastRefreshWasAt.utc_offset/60/60).to_s)
            @refreshTimeShouldBe -= 1.0/24 if @refreshTimeShouldBe > n
            @refreshTimeShouldBe -= 1.0/60/24
        end
    end

    def setFileLocation(config, cacheStore)

        if config['fileLocation'].nil?
            dataLocation = config['dataLocation']
            require 'uri'
            uri = URI.parse(dataLocation)
            fileName = File.basename(uri.path)

            @fileLocation = cacheStore + '/' + fileName
        else
            @fileLocation = config['fileLocation']
        end
    end

    def cacheFresh?()
        if File.exists?(@fileLocation)
            File.stat(@fileLocation).mtime >= @refreshTimeShouldBe
        else
            FALSE
        end
    end

    def refreshIfRequired()
        if !cacheFresh?()
            refresh()
        end
    end

    def getFileLocation
        return @fileLocation
    end

    def refresh
        storeDir = Cache.dirname(@fileLocation)
        #debugger
        if ! File.directory?(storeDir)
            $stderr.puts "Creating dir #{storeDir}" if $debug
            `mkdir -p #{storeDir}`
        else
            $stderr.puts "#{storeDir} exists already" if $debug
        end

        case @confName
        when Cache::CITY_LIST
            Location.refreshData(@dataLocation, @fileLocation)

        when Cache::NOWCASTING

        end
    end



end
