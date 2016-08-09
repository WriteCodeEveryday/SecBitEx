class VisitorsController < ApplicationController
	def configurable
		@allow_seller_delays = getToken('ALLOW_SELLER_DELAYS') == 'true' rescue false
		@allow_seller_kyc_collect = getToken('ALLOW_SELLER_KYC_COLLECT') == 'true' rescue false
		@allow_seller_limits = getToken('ALLOW_SELLER_KYC_COLLECT') == 'true' rescue false
		@config_provider = getToken('CONFIG_PROVIDER')
		@mailgun_email = getToken('MAILGUN_EMAIL') == 'true' rescue false
		@twilio_twofa = getToken('TWILIO_2FA') == 'true' rescue false
		@bitcoin_network = getToken('BITCOIN_NETWORK') == 'livenet' rescue false
		@stripe_network = getToken('STRIPE_NETWORK') == 'production' rescue false
		@withdrawl = getToken('WITHDRAWL_METHOD') == 'true' rescue false
	end
end
