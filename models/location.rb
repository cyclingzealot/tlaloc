class Location
    @latitude
    @logitude
    @code
    @name
    @timezone



    def self.searchCity(city)
        storePath='/tmp/README_nowcasting_prevision-immediate.txt'
        url='http://dd.meteo.gc.ca/nowcasting/doc/README_INCS-SIPI.txt'
        if ! File.exists?(storePath)
            puts "Downloading station list from #{url} to #{storePath}" if $$debug
            `lynx --dump #{url} > #{storePath}`
        else
            puts "Not downloading station list from #{url} to #{storePath}, already got it" if $debug
        end
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
end
