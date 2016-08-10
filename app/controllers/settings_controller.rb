class SettingsController < ApplicationController
	protect_from_forgery with: :null_session

	def add_wallet
		@user = current_user

		@valid_address = false
		@wrong_network = getTokenBoolean('BITCOIN_NETWORK') 
		if @wrong_network
			Bitcoin.network = :bitcoin
		else
			Bitcoin.network = :testnet3
		end

		@valid_address = Bitcoin::valid_address?(params['public_address']) && current_user.addresses.where({:public_key => params['public_address']}).count == 0

		if @valid_address
			@address = Address.new
			@address.public_key = params['public_address']
			@address.user_id = @user.id
			@address.save
			
			@code = 200
			@results = {
				:status => @code,
				:message => "Address Stored Successfully"
			}

			render json: @results, code: @code
		else
			@code = 400
			@results = {
				:status => @code,
				:error => "Incorrect Bitcoin Network / Invalid Address / Duplicate Address"
			}
			render json: @results, code: @code
		end
	end

	def add_stripe_info
		@user = current_user

		@wrong_network = getTokenBoolean('STRIPE_NETWORK') 
		if @wrong_network
			@wrong_network = (params['stripe_public'].include?('pk_test') || params['stripe_public'].include?('sk') || params['stripe_private'].include?('sk_test') || params['stripe_private'].include?('pk'))
		else
			@wrong_network = (params['stripe_public'].include?('pk_live') || params['stripe_public'].include?('sk') || params['stripe_private'].include?('sk_live') || params['stripe_private'].include?('pk'))
		end

		if !@wrong_network && !@user.stripe_info
			@stripe_info = StripeInfo.new
			@stripe_info.publishable_key = params['stripe_public'].strip
			@stripe_info.secret_key = params['stripe_private'].strip
			@stripe_info.user_id = @user.id
			@stripe_info.save

			@code = 200
			@results = {
				:status => @code,
				:message => "Stripe Info Stored Successfully"
			}

			render json: @results, code: @code
		else
			@code = 400
			@results = {
				:status => @code,
				:error => "Incorrect Stripe Network / Incorrect Key Order / Duplicate Keys"
			}
			render json: @results, code: @code
		end
	end
end