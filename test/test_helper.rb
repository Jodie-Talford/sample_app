ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# require 'rails/test_help'
require 'test/unit/rails/test_help'
# Although many systems will show the appropriate colors for red and green
# test suites, adding minitest reporters lends a pleasant polish to test outputs
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Add more helper methods to be used by all tests here...
  include ApplicationHelper

end
