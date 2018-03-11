require_relative './cache.rb'
require_relative './models/location.rb'
require_relative './conf/timezoneGoogleApiConf.rb'
require 'byebug'

Location::configureTimeZoneLookup

if not Location::timeZoneLookupReady?
    raise "timeZoneLookup not ready."
end

Location::updateTimeZoneData

