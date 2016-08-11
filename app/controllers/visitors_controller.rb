class VisitorsController < ApplicationController
	def configurable
		@allow_seller_delays = getTokenBoolean('ALLOW_SELLER_DELAYS')
		@allow_seller_kyc_collect = getTokenBoolean('ALLOW_SELLER_KYC_COLLECT')
		@allow_seller_limits = getTokenBoolean('ALLOW_SELLER_KYC_COLLECT')
		@seller_fee = getTokenNumber("SELLER_FEE") rescue 0
		@buyer_fee = getTokenNumber("BUYER_FEE") rescue 0
		@config_provider = getToken('CONFIG_PROVIDER')
		@mailgun_email = getTokenBoolean('MAILGUN_EMAIL')
		@twilio_twofa = getTokenBoolean('TWILIO_2FA')
		@withdrawl = getTokenBoolean('WITHDRAWL_METHOD')
		@bitcoin_network = getToken('BITCOIN_NETWORK') == 'livenet' rescue false
		@stripe_network = getToken('STRIPE_NETWORK') == 'production' rescue false
	end
end
