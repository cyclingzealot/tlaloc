require_relative '../../conf/cacheConf.rb'

class Nowcasting


    DATA_LOCATION = 'http://dd.weather.gc.ca/nowcasting/matrices/?C=M;O=A'
    FILE_LOCATION = $cacheConf['matrixList']['fileLocation']


    def self.refreshData()
        if $devOffLine.nil? or $devOffLine == false
            urlBase=Nowcasting::DATA_LOCATION
            fileURL=`lynx --dump '#{urlBase}' | tail -n 1 | cut -d ' ' -f 4`.chomp
            `curl -s #{fileURL} | gzip -dc > #{Nowcasting::FILE_LOCATION}`
        end
    end


    def self.getDataForCity(cityCode)
        c = Cache.new('matrixList')

        c.refreshIfRequired

        data = `cat #{Nowcasting::FILE_LOCATION} | grep #{cityCode} -A 28`
    end
end
