# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'

  namespace :admin do
    root 'home#index'
    resource :exchange_rate
  end
end
