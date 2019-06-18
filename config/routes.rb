Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'categories#index'

  scope shallow_path: "sekret" do
    resources :categories do
      resources :subcategories
    end
  end

  resources :advertisements

  resources :users

  get '/search' => 'search#index'

end
