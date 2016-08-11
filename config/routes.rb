Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/features/configurable' => 'visitors#configurable'
  get '/features/custody' => 'visitors#custody'
  get '/features/peertopeer' => 'visitors#peertopeer'
  get '/features/opensource' => 'visitors#opensource'
  get '/stats' => 'visitors#stats'

  get '/dashboard' => 'page#dashboard'

  get '/dashboard/buy/create' => 'page#buy_create'
  get '/dashboard/buy/finalize/:buy_id' => 'page#buy_finalize_select'
  get '/dashboard/buy/kyc/:buy_id/:sell_id' => 'page#buy_kyc'
  get '/dashboard/buy/finalize/:buy_id/:sell_id' => 'page#buy_finalize_complete'

  get '/dashboard/sell/create' => 'page#sell_create'
  get '/dashboard/sell/kyc/:sell_id/:buy_id' => 'page#sell_kyc'

  get '/dashboard/settings' => 'page#settings'

  post '/dashboard/settings/add_wallet' => 'settings#add_wallet'
  post '/dashboard/settings/add_stripe_info' => 'settings#add_stripe_info'

  get '/users/two_factor' => 'users#two_factor'
  post '/users/two_factor_check' => 'users#two_factor_check'
  post '/users/two_factor_generate' => 'users#two_factor_generate'
  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :users
end
