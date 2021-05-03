Gem::Specification.new do |s|
  s.name        = 'utopia_site_helpers'
  s.version     = '0.0.1'
  s.summary     = "Helper to simplify common tasks for new Utopia sites"
  s.description = "Sets up common database parameters to simplify the integration of ActiveRecord into Utopia sites. Sets up common RSpec helpers and contexts to simplify testing of Utopia sites."
  s.authors     = ["Michael Adams"]
  s.email       = 'michael@michaeladams.org'
  s.files       = [
		"lib/utopia_site_helpers.rb",
		"lib/utopia_site_helpers/active_support/time_zone_fixes.rb",
		"lib/utopia_site_helpers/auto_reload.rb",
		"lib/utopia_site_helpers/db.rb",
		"lib/utopia_site_helpers/exceptions/ses_mailer.rb",
		"lib/utopia_site_helpers/rspec.rb",
		"lib/utopia_site_helpers/rspec/capybara.rb",
		"lib/utopia_site_helpers/rspec/db.rb",
		"lib/utopia_site_helpers/rspec/time.rb",
		"lib/utopia_site_helpers/rspec/vcr.rb",
		"lib/utopia_site_helpers/rspec/website.rb",
		"lib/utopia_site_helpers/session/without_user_agent.rb",
	]
  s.license     = 'MIT'
	s.homepage    = 'http://michael.net.nz'
end
