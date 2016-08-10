class PageController < ApplicationController
	before_action :authenticate_user!
	def dashboard
	end
	
	def settings
		@stripe_public_exists = (current_user.stripe_info.present? && current_user.stripe_info.publishable_key.present?)
		@stripe_private_exists = (current_user.stripe_info.present? && current_user.stripe_info.secret_key.present?)
		
		@buy_status = current_user.addresses.count > 0
		@sell_status = @buy_status && @stripe_public_exists && @stripe_private_exists
	end

	def buy
	end

	def sell
	end
end