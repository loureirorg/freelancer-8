Rails.application.routes.draw do
  root 'application#frontpage'
  get '/contacts/gmail/callback', to: 'importers#gmail'
  get '/contacts/linkedin/callback', to: 'importers#linkedin'
  get '/contacts/hotmail/callback', to: 'importers#hotmail'
  get '/contacts/yahoo/callback', to: 'importers#yahoo'
  resources :posts
  get 'my-contacts', to: 'contacts#index', as: :contacts

  devise_for :users,
    controllers: {
      omniauth_callbacks: "omniauth_callbacks"
    }
end
