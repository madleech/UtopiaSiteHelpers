require 'variant'
require 'active_record'

# Set up minimal configuration to establish a database connection, based on the contents of DATABASE_DSN env var.
ENV['RAILS_ENV'] = Variant.for(:database).to_s

ActiveRecord::Base.configurations = {
	Variant.for(:database) => ENV['DATABASE_DSN'],
}

ActiveRecord::Base.establish_connection

# Set up logger for AR
ActiveRecord::Base.logger = Logger.new($stderr)
ActiveRecord::Base.logger.level = ENV['DEBUG_SQL'] ? Logger::DEBUG : Logger::WARN
