class SessionsController < Devise::SessionsController
  after_filter :after_login, :only => :create

  def after_login
  	generate_two_fact
  end
end
