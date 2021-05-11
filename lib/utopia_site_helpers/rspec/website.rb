require 'rack/test'

RSpec.shared_context "website" do
	include Rack::Test::Methods

	let(:rackup_path) { "#{RSpec::Core::RubyProject.root}/config.ru" }
	let(:rackup_directory) { File.dirname(rackup_path) }

	let(:app) { Rack::Builder.parse_file(rackup_path).first }
	let(:host) { [Capybara.current_session.server.host, Capybara.current_session.server.port || 80].join(':') }
end
