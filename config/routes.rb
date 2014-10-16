Rails.application.routes.draw do
  devise_for :users
  StaticPage.slugs.each do |slug|
    get slug.to_sym, controller: :pages
  end

  root 'pages#index'
end
