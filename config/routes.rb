Rails.application.routes.draw do
  resources :histories

  get 'users/sign_up', to: 'users#new'
  get 'users/sign_in', to: 'sessions#new'
  post 'users', to: 'users#create'
  root "histories#index"
  resources :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users do
    member do
      get 'preview'
    end
  end

  get 'users/histories', to: 'histories#history', as: 'user_histories'

end
