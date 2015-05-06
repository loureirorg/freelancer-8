Rails.application.routes.draw do
  root 'application#frontpage'
  get '/contacts/gmail/callback', to: 'importers#gmail'
  get 'disconnect_facebook', to: 'application#disconnect_facebook', as: :disconnect_facebook
  get 'disconnect_google', to: 'application#disconnect_google', as: :disconnect_google
  resources :posts
  get 'my-contacts', to: 'contacts#index', as: :contacts

  devise_for :users,
    controllers: {
      omniauth_callbacks: "omniauth_callbacks"
    }
end
