Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post 'users/sign_up'  => 'users#create'
      post 'users/sign_in'  => 'sessions#create'
      get  'users/sign_out' => 'sessions#destroy'
      get  'profile'        => 'users#show'
      put  'profile'        => 'users#update'
    end
  end
end
