# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'seasons' => 'seasons#index'
      get 'movies' => 'movies#index'
      get 'library' => 'purchases#index'

      resources :purchase_options, only: :index do
        resources :purchases, only: :create
      end
    end
  end
end
