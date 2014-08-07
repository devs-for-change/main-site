Rails.application.routes.draw do
  devise_for :users

  get 'about', controller: 'welcome'

  root 'welcome#index'
end
