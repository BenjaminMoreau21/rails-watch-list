Rails.application.routes.draw do
  root "lists#index"
  resources :lists, except: :index do
    resources :bookmarks, only: [:create]
    resources :reviews, only: [:create]
  end
  delete "bookmarks/:id", to: "bookmarks#destroy", as: "bookmark"
end
