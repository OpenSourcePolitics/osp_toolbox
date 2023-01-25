# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  resources :processings, except: %i[edit update create new destroy] do
    resources :analyses, except: %i[edit update] do
      post "/redo_analysis", to: "analyses#redo_analysis"
    end
  end

  resources :preprocessings do
    post "/redo_preprocessing", to: "preprocessings#redo_preprocessing"
  end

  resources :documents do
    resources :input_files, except: [:index]
    post "/process_archive", to: "documents#process_archive"
  end

  post "/preprocessed_data", to: "preprocessings_data#preprocessed_data"
  post "/analysis_data", to: "analyses_data#store_analysis_data"

  devise_for :users, controllers: {
    sessions: "devise/sessions",
    registrations: "devise/registrations"
  }

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
    get "/debug", to: "pages#debug"
  end

  root to: "pages#home"
end
