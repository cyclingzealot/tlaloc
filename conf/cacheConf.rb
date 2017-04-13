$cacheConf = { 'sunset' => {
 'dataLocation'     => "xmINxak4tZ6YmqnwcfkfnWN6q",
 'minLines'         => "795219625957031936-wLW2IM902wQpevD23BWkPwNadE5duam",
 'refresh'          =>  "" ,
}, 'matrixList' => {
 'dataLocation'     => "xmINxak4tZ6YmqnwcfkfnWN6q",
 'fileLocation'     => '/tmp/tlaloc.ecData.txt',
 'minLines'         => 21120 * 0.9,
 'refresh'          =>  27 ,
}, 'cityList' => {
 'dataLocation'     => "http://dd.meteo.gc.ca/nowcasting/doc/README_INCS-SIPI.txt",
 'minLines'         => 1429*0.9,
 'refresh'          =>  Cache::NEVER ,
}
}

$cacheStore        = "/tmp/tlaloc/"
