require 'active_record'
require 'active_record/fixtures'

# Configure fixtures and transactions around tests
module RSpec
	module ActiveRecord
		module FixtureSupport
			extend ::ActiveSupport::Concern
			include ::ActiveRecord::TestFixtures

			def method_name
				if defined? @example
					@example
				else
					described_class
				end
			end

			# @private prevent ActiveSupport::TestFixtures to start a DB transaction.
      # Monkey patched to avoid collisions with 'let(:name)' in Rails 6.1 and after
      # and let(:method_name) before Rails 6.1.
      def run_in_transaction?
        use_transactional_tests && !self.class.uses_transaction?(self)
      end

			included do
				self.use_transactional_tests = true
				self.pre_loaded_fixtures = false
				self.fixture_path = File.expand_path("../db/fixtures/test", __dir__)
			end
		end
	end
end

# Set up a shared context for tests to run each test in its own transaction
RSpec.shared_context "database" do
	around(:example) do |test|
		begin
			setup_fixtures

			test.run
		ensure
			teardown_fixtures
		end
	end
end

RSpec.configure do |config|
	config.include RSpec::ActiveRecord::FixtureSupport

	# always run every test in a transaction
	config.include_context "database"
end
