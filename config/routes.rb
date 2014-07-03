Rails.application.routes.draw do

  resources :posts, only: [:new, :destroy, :create, :show] do
    resources :links, only: [:new, :create, :destroy]
  end

  resources :circles, except: [:index]

  resource :session, only: [:new, :create, :destroy]

  resources :users do 
    resources :posts, only: [:index]
  end
  
  
  
  get 'users/:id/feed', :to => "users#feed", as: "feed"

end
