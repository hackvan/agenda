Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post 'users/sign_up' => "users#create"
    end
  end
end
