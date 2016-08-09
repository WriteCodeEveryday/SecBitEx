# SecBitEx - Status: Non-Functional
Secure Bitcoin Exchange (open source, non-custodial bitcoin exchange prototype, MIT license)

# Initial Ideas
All users will submit a public key. This will act as their 'Wallet'

Cashouts can be performed "automatically" or through a "manual WIF import"

This proof of concept is going to be "functional", not "pretty"

# Configuration Management
This proof of concept should be highly configurable

Configurations can be stored in environment tokens or ActiveRecord model "Settings"

The following are the list of configuration options (missing keys will return as false/nil)
* CONFIG_PROVIDER - should be "db" or "env" (required in either environment tokens or ActiveRecord::Settings)
* TWILIO_2FA - "true"/"false" whether or not to enforce 2FA for all users
* TWILIO_ACCOUNT_SID - only needed if TWILIO_2FA exists/is true
* TWILIO_API_KEY - only needed if TWILIO_2FA exists/is true
* TWILIO_API_SECRET - only needed if TWILIO_2FA exists/is true
* MAILGUN_EMAIL - "true"/"false" whether or not to send mailgun emails users (removing this will make all email communication fail)
* MAILGUN_API_KEY - only needed if MAILGUN_API exists/is true
* MAILGUN_DOMAIN - only needed if MAILGUN_API exists/is true (mg.yourdomainhere.com)
* ALLOW_SELLER_KYC_COLLECT - "true"/"false" to allow sellers to collect KYC during sales (mostly ID/selfie pictures)
* ALLOW_SELLER_DELAYS - "true"/"false" to allow sellers to delay sales
* ALLOW_SELLER_LIMITS - "true"/"false" to allow sellers to impose limits on buyers
* BITCOIN_NETWORK - "testnet" / "livenet" for network to use
* STRIPE_NETWORK - "test" / "production" for network to use

# Deployment Options [![Deploy To Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/AtheistOfFail/SecBitEx)
These are the proposed outside services for the stack on Heroku
* Uses devise for login/account creation tasks
* Uses sidekiq for Trade Engine Scheduling / Task Scheduling
* Uses Postgres for Storage
* Uses RedisToGo for Caching / Scheduling of tasks
* Uses Twilio for 2FA (if enabled)
* Uses Mailgun for Email Services (if enabled)
* Uses Stripe for ACH (each seller provides their Stripe key pair)


# Bitcoin Sellers
* Sellers will sell their coins by creating a sell order and transferring to the exchange wallet.
* If there's a buy order in their range, they will be shown that there is a buy order in range.

# Bitcoin Sellers Config Options
Sellers can also select the following additional configuration options (depending on configuration)
* Only Sell To Buyers Exceeding (USD / BTC Limit Purchased)
* Delayed Fund Release (Instant, 1 Day, 3 Day, 7 Day)
* Require ID / Selfie (Will use Webcam.js for taking a picture)

# Bitcoin Buyers
* Buyers will buy their coins by creating a buy order (with no credentials required). 
* They will receive an email when a sell order is valid for their buy order. 
* At this point, they will supply ACH credentials for the buy order.

# Bitcoin Buyers Config Options
Buyers can also select from the following additional config options (depending on configuration)
* ID / Selfie (true/false)
* Instant or Delayed