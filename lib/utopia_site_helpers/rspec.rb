require 'variant'

# Ensure that we're always running as the test variant
Variant.force!(:testing)

# Set up environment, e.g. libraries, DB, config etc
require_relative "#{RSpec::Core::RubyProject.root}/config/environment"
