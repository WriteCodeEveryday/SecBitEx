class VisitorsController < ApplicationController
	def configurable
		@allow_seller_delays = getTokenBoolean('ALLOW_SELLER_DELAYS') == 'true'
		@allow_seller_kyc_collect = getTokenBoolean('ALLOW_SELLER_KYC_COLLECT') == 'true'
		@allow_seller_limits = getTokenBoolean('ALLOW_SELLER_KYC_COLLECT') == 'true'
		@config_provider = getToken('CONFIG_PROVIDER')
		@mailgun_email = getTokenBoolean('MAILGUN_EMAIL') == 'true'
		@twilio_twofa = getTokenBoolean('TWILIO_2FA') == 'true'
		@withdrawl = getTokenBoolean('WITHDRAWL_METHOD') == 'true'
		@bitcoin_network = getToken('BITCOIN_NETWORK') == 'livenet' rescue false
		@stripe_network = getToken('STRIPE_NETWORK') == 'production' rescue false
	end
end
