# Ensure that we're always running as the test variant
ENV['UTOPIA_VARIANT'] = 'test'

# Set up environment, e.g. libraries, DB, config etc
require_relative "#{RSpec::Core::RubyProject.root}/config/environment"
