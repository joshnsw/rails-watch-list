Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new,:create] do
    resources :bookmarks, only: [:index,:new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"

  resources :bookmarks, only: [:destroy]
end
