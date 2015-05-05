Rails.application.routes.draw do
  root 'application#frontpage'
  get 'disconnect_facebook', to: 'application#disconnect_facebook', as: :disconnect_facebook
  resources :posts

  devise_for :users,
    controllers: {
      omniauth_callbacks: "omniauth_callbacks"
    }
end
