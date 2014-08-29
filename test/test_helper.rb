ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

 include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end
