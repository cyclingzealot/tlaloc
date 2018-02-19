require_relative './channel.rb'
class CliChannel < Channel

    def publish()
        puts @analysis.to_s
        #(or finalStr = bodyStr + windStr + popStr + windTimes)
    end
end
