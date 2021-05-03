require 'console'
require 'zeitwerk'

# Place this at the top of your config.ru to automatically reload all models every time guard fires.
if defined?(UTOPIA) && UTOPIA.development?
	Console.logger.warn "Reloading models"

	# fix STI load errors
	ActiveSupport::Dependencies.remove_unloadable_constants! if defined?(ActiveSupport)

	# reload each namespace
	Zeitwerk::Registry.loaders.each(&:reload)

	# prevent endless races
	sleep 0.1
end
