require 'selenium-webdriver'
require 'capybara/rspec'
require 'faker'
require 'site_prism'

require_relative '../page_objects/pages/login_page'

RSpec.configure do |config|
  def options
    Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
  end

  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.add_selector(:dqs) do
    css { |v| "*[data-qa-selector=#{v}]" }
  end
end
