require 'bundler'
Bundler.require(:default, :test)

require "rspec"
require "capybara/rspec"

middleman_app = ::Middleman::Application.new do
  set :root, Dir.pwd
  set :environment, :test
  set :show_exceptions, true
end

Capybara.app = ::Middleman::Rack.new(middleman_app).to_app

RSpec.configure do |config|
  config.order = :random
end