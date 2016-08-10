class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :verify_two_fact, :except => [:generate_two_fact]
  include SettingsHelper
  
  def verify_two_fact
  	if current_user && current_user.two_fac_code != nil
  		redirect_to '/users/two_factor'
  	end
  end

  def generate_two_fact
    if getTokenBoolean('TWILIO_2FA') && current_user.phone && current_user.phone != ""
      @two_factor = 100000 + rand(900000)
      current_user.two_fac_code = @two_factor
      current_user.save

      #Need to actually send code here
    end
  end
end
