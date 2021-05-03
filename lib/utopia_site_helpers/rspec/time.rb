require 'timecop'

# freeze time
RSpec.configure do |config|
  config.around(:example, :time) do |test|
		time = test.metadata[:time]
		time = Time.parse(time) unless time.is_a? Time
		Timecop.freeze(time) do
			test.run
		end
  end
end
