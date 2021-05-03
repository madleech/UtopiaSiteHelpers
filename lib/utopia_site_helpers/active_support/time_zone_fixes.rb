require 'active_support/values/time_zone'

# fix weird rounding of dates, where $TZ.at(a).end_of_day != $TZ.at($TZ.at(a).end_of_day)
module ActiveSupport
	class TimeZone
		def at(time)
			Time.at(time.to_i).utc.in_time_zone(self)
		end
	end
end
