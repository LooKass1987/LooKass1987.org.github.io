Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  root 'statics#home'

  # Static
  get '/about', to: 'statics#about'
  get '/faq', to: 'statics#faq'
  post '/control', to: 'statics#control'

  # Contact
  get '/contact', to: 'contact#show'
  post '/contact', to: 'contact#deliver'

  # Service
  resources :services, only: [:index, :show] do
    get ':item', item: /[^\/]+/, on: :member, to: 'services#item', as: :item
  end

  # Article
  resources :articles, only: [:index, :show] do
    get 'range/:year(/:month(/:day))', year: /[\d]{4}/, month: /[\d]{1,2}/, day: /[\d]{1,2}/,
        on: :collection, to: 'articles#index', as: :range
  end

  # Partner
  resources :partners, only: [:index]

  # Devise
  devise_for :users #, ActiveAdmin::Devise.config

  # Active Admin
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

end
