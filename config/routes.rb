Rails.application.routes.draw do
  devise_for :administrators
  devise_for :users

  scope module: 'admin' do
    root 'administrators#index'
    resources :administrators
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#create'
    end
  end
end
