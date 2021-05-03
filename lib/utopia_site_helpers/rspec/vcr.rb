require 'vcr'

# Set up common VCR options
VCR.configure do |config|
	config.cassette_library_dir = "spec/fixtures/cassettes"
	config.hook_into :webmock
	config.configure_rspec_metadata!
	config.allow_http_connections_when_no_cassette = true
	config.ignore_localhost = true
	config.default_cassette_options = {allow_playback_repeats: true}
end
