Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  StaticPage.slugs.each do |slug|
    get slug.to_sym, controller: :pages
  end

  resources :contacts, only: [:create]

  root 'pages#index'
end
