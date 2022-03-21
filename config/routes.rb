Rails.application.routes.draw do
  devise_for :administrators

  scope module: 'admin' do
    root 'administrators#index'
    resources :administrators
  end
end
