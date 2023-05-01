require 'capybara/rspec'
require 'dotenv/load'
require 'ffaker'
require 'selenium-webdriver'
require 'site_prism'
require 'require_all'

require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'modules'

include Helpers

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
