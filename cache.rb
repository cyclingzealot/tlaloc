

class Cache

    @fileLocation
    @dataLocation
    @refreshTimeShouldBe
    @minLines

    NEVER = -1

    def self.loadConf
        require_relative 'conf/cacheConf.rb'
    end

    def self.fileOK(path, minLines)
        return ((File.exists?(path)) and (`wc -l "#{path}"`.strip.split(' ')[0].to_i > minLines))
    end

    def self.dirname(path)
        File.dirname(File.expand_path(__FILE__))
    end


    def initialize(confName)
        Cache.loadConf
        config = $cacheConf[confName]
        @dataLocation = config['dataLocation']
        @minLines = config['minLines']

        setRefreshTimeShouldBe(config['refresh'])

        setFileLocation(@dataLocation, $cacheStore)
    end

    def setRefreshTimeShouldBe(refreshPolicy)
        if refreshPolicy == Cache::NEVER
            @refreshTimeShouldBe = Time.new(1971)
        end
    end

    def setFileLocation(dataLocation, cacheStore)
        require 'uri'
        url = 'http://www.example.com/foo/bar/filename.jpg?2384973948743'
        uri = URI.parse(url)
        fileName = File.basename(uri.path)

        @fileLocation = cacheStore + '/' + fileName
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
        IF dir does not exist
            `mkdir $storeDir`
        end
        `lynx --dump #{@dataLocation} > #{@fileLocation}`
    end



end
