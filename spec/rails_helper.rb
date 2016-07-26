# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'net/http'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.include Devise::TestHelpers, type: :controller
end

# ENV["RAILS_ENV"] ||= 'test'
# require File.expand_path("../../config/environment",__FILE__)
# require 'rspec/rails'
# require "capybara/rspec"
# include Capybara::DSL

# RSpec.configure do |config|
# config.include Devise::TestHelpers, :type => :controller
# config.extend ControllerMacros, :type => :controller
# end