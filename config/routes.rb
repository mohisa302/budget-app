Rails.application.routes.draw do
  root 'splash#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  devise_for :users, controllers: { registrations: "registrations" }
  resources :categories, only: [:index, :new, :create]
  resources :users do
    resources :categories do 
      resources :budgets, only: [:index, :show, :new, :create, :update, :destroy]
      resources :transactions, only: [:index, :show, :new, :create, :update, :destroy]
    end
  end

  # Define any other custom routes you need here
end
