require 'utopia/session'

class Utopia::Session
	# ignore changes to user agent
	def validate_session!(request, values)
		if (expires_at = expires(values[:updated_at]))
			if expires_at < Time.now.utc
				raise PayloadError, "Expired session cookie, user agent submitted a cookie that should have expired at #{expires_at}."
			end
		end

		return true
	end
end
