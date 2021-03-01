Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :ingredients
  end
  resources :recipes do
    resources :steps
  end
  resources :categories do
    resources :recipes, only: :index
  end
  root 'recipes#index'
end
