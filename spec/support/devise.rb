require 'devise'
include Warden::Test::Helpers

module ControllerMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
    user
  end
end

module FeatureHelpers
  def login_user
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    user
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerMacros, :type => :controller
  config.include FeatureHelpers, type: :feature
end
