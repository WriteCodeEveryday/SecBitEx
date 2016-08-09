Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/features/configurable' => 'visitors#configurable'
  get '/features/custody' => 'visitors#custody'
  get '/features/peertopeer' => 'visitors#peertopeer'
  get '/features/opensource' => 'visitors#opensource'
  get '/stats' => 'visitors#stats'
  devise_for :users
  resources :users
end
