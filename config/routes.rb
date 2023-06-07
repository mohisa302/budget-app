Rails.application.routes.draw do
  root 'splash#index' # set the root route to the splash#index action

  devise_for :users

  # Define any other custom routes you need here
end
