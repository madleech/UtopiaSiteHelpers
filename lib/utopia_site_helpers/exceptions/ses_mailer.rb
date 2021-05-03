require 'console'
require 'aws-sdk-ses'
require 'utopia'

module Utopia
	module Exceptions
		# Sends site error emails via SES
		class SesMailer < Utopia::Exceptions::Mailer
			def send_notification(exception, env)
				Console.logger.warn "Caught exception: #{exception}"

				mail = generate_mail(exception, env)

				# credentials come from environment variables, or instance profile (when running on AWS)
				client = Aws::SES::Client.new(region: ENV['AWS_SES_REGION'])
				client.send_raw_email(
					destinations: [@to],
					raw_message: {data: mail.to_s},
				)
			rescue => error
				Console.logger.error 'Error sending exception email', error
			end

			def self.send!(exception, request:)
				self
				.new({}, to: 'errors@michaeladams.org', from: 'utopia@server.ovrcome.io')
				.send_notification(exception, request.env)
			end
		end
	end
end
