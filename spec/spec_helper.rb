# frozen_string_literal: true

require 'capybara/rspec'
require 'dotenv/load'
require 'ffaker'
require 'selenium-webdriver'
require 'site_prism'
require 'require_all'
require 'rest-client'

require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'modules'

include Helpers
include ApiWrappers

RSpec.configure do |_config|
  def chrome_options
    Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
  end

  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end

  Capybara.add_selector(:dqs) do
    css { |v| "*[data-qa-selector=#{v}]" }
  end
end
