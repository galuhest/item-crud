require "bundler/setup"
require "item/crud"
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../item-crud.rb', __FILE__

# Module ini akan mengintegrasikan sinatra agar bisa di test
module RSpecMixin
  include Rack::Test::Methods
  # Function untuk mengintegrasikan sinatra
  def app() Sinatra::Application end
end

RSpec.configure do |config|
	config.include RSpecMixin
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
