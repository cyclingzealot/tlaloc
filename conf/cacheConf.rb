$cacheConf = { 'sunset' => {
 'dataLocation'     => "xmINxak4tZ6YmqnwcfkfnWN6q",
 'minLines'         => "795219625957031936-wLW2IM902wQpevD23BWkPwNadE5duam",
 'refresh'          =>  Cache::NEVER ,
}, 'matrixList' => {
 'fileLocation'     => '/tmp/tlaloc.ecData.txt',
 'minLines'         => 21120 * 0.9,
 'refresh'          =>  27 ,
}, 'cityList' => {
 'dataLocation'     => "http://dd.meteo.gc.ca/nowcasting/doc/README_INCS-SIPI.txt",
 'minLines'         => 1429*0.9,
 'refresh'          =>  Cache::NEVER ,
}
}

$devOffLine = false
if $devOffLine #and `lynx --dump 'http://www.google.ca' 2>&1`.include?("Unable to connect")
    samplePath = `echo $PWD`.chomp + '/dataSamples/dd.weather.gc.ca/nowcasting/matrices/SCRIBE.NWCSTG.01.20.13Z.n'
    $cacheConf['matrixList']['fileLocation'] = samplePath
    $stderr.puts "Using #{samplePath} because $devOffLine = true"
end

$cacheStore        = "/tmp/tlaloc/"
