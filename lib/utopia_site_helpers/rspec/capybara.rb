require 'falcon/capybara'
require 'capybara/rspec'
require 'webdrivers'
require 'selenium/webdriver'

Capybara.threadsafe = true
Capybara.configure do |config|
	config.server = :falcon
	config.app = Rack::Builder.parse_file("#{RSpec::Core::RubyProject.root}/config.ru").first
	# Allows first(selector) to wait for a short time until the element becomes available. Useful if the element is animated.
	config.default_max_wait_time = 5
end

# Work around ubuntu chromium snap issues
if File.exist?("/snap/chromium/current/usr/lib/chromium-browser/chrome")
	Selenium::WebDriver::Chrome.path = "/snap/chromium/current/usr/lib/chromium-browser/chrome"
end

# Allow running in non-headless mode by specifying HEADLESS=false when running tests
if ENV['HEADLESS'] == 'false'
	Capybara.javascript_driver = :selenium_chrome
else
	Capybara.javascript_driver = :selenium_chrome_headless
end
