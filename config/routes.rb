Rails.application.routes.draw do
  resources :preprocessings do
    match '/redo_preprocessing', to: 'preprocessings#redo_preprocessing', via: :post
  end
  resources :documents do
    resources :input_files, except: [:index]
    match '/process_archive', to: 'documents#process_archive', via: :post
  end

  devise_for :users
  root to: "pages#home"
end
