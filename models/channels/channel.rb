class Channel
    extend AbstractClass

    attr_reader :analysis
    attr_accessor :debug

    def initialize(analysis)
        @analysis = analysis
    end

    def publish
    end

end

