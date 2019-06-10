Rails.application.routes.draw do
  root 'categories#index'
  resources :categories do
    :subcategories
  end
end
