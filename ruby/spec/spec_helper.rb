require 'rspec'
require 'json'
require './api/base'
require './api/booking'
require './api/authorise'
require './payloads/booking_payload'
require './payloads/authorise_payload'

RSpec.configure do |config|
  config.before(:each) do
    ENV['SITE_URL'] = 'https://restful-booker.herokuapp.com'
  end
end
