Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'categories#index'

  resources :categories do
    resources :subcategories
  end

  resources :users

end
