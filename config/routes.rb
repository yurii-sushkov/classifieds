# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'categories#index'

  resources :categories

  resources :advertisements

  resources :users

  resources :search, only: %i[index show]

  resources :conversations do
    resources :messages
  end
end
