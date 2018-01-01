require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'active_support'

Capybara.configure do |config|
  config.default_driver = :poltergeist
  config.app_host   = 'https://salty-savannah-33557.herokuapp.com/values'
end

World(Capybara)
