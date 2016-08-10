class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_two_fact, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def two_factor
    @phone = current_user.phone
    @updated_at = current_user.updated_at
  end 

  def two_factor_check
    @code_set = current_user.two_fac_code
    @code_provided = params[:code]

    if @code_set == @code_provided
      current_user.two_fac_code = nil
      current_user.save
      redirect_to '/dashboard/'
    else
      redirect_to :back, :alert => "Wrong Code."
    end
  end

  def two_factor_generate
    if current_user.updated_at < 10.minutes.ago
      generate_two_fact
      redirect_to :back, :message => "New Code Sent."
    else
      redirect_to :back, :alert => "New Codes Can Only Be Generated Every Ten Minutes."
    end
  end
end
