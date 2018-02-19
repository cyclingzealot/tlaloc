class Channel

    attr_reader :analysis
    attr_accessor :debug

    def initialize(analysis)
        @analysis = analysis
    end

    def publish
        raise "Channel.publish is an abstract method.  Please use one of the concrete Channel classes (ie TwitterChannel, CliChannel)"
    end

end

