Rails.application.routes.draw do
  resources :documents do
    resources :input_files, except: [:index]
  end
  devise_for :users
  root to: "pages#home"
end
