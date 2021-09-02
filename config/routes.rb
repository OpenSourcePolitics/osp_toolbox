# frozen_string_literal: true

Rails.application.routes.draw do
  resources :processings, except: [:edit, :update, :create, :new, :destroy] do
    get "/wordcloud_analysis", to: "processings#wordcloud_analysis"
    get "/speech_analysis", to: "processings#speech_analysis"
    post "/redo_analysis", to: "processings#redo_analysis"
  end

  resources :preprocessings do
    post "/redo_preprocessing", to: "preprocessings#redo_preprocessing"
  end

  resources :documents do
    resources :input_files, except: [:index]
    post "/process_archive", to: "documents#process_archive"
  end

  post "/preprocessed_data", to: "preprocessings_data#preprocessed_data"

  devise_for :users
  root to: "pages#home"
end
