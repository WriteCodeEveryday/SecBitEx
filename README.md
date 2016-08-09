# SecBitEx
Secure Bitcoin Exchange (open source, non-custodial bitcoin exchange prototype, MIT license)

# Initial Ideas
All users will submit a public key. This will act as their 'Wallet'

Cashouts can be performed "automatically" or through a "manual WIF import"

This proof of concept is going to be "functional", not "pretty"

ACH Transfers will be provided by Stripe

Initial Setup provided by RailsComposer.

# Deployment Options - Heroku

* Uses sidekiq for Trade Engine Scheduling / Task Scheduling
* Uses Postgres for Storage
* Uses Redis To Go for Caching / Scheduling of tasks

[![Deploy To Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)



# Bitcoin Sellers
* Sellers will sell their coins by creating a sell order and transferring to the exchange wallet.
* If there's a buy order in their range, they will be shown that there is a buy order in range.

# Bitcoin Sellers Config Options
Sellers can also select the following additional configuration options
* Only Sell To Buyers Exceeding (USD / BTC Limit Purchased)
* Delayed Fund Release (Instant, 1 Day, 3 Day, 7 Day)
* Require ID / Selfie (Will use Webcam.js for taking a picture)

# Bitcoin Buyers
* Buyers will buy their coins by creating a buy order (with no credentials required). 
* They will receive an email when a sell order is valid for their buy order. 
* At this point, they will supply ACH credentials for the buy order.

# Bitcoin Buyers Config Options
Buyers can also select from the following additional config options
* ID / Selfie (true/false)
* Instant or Delayed