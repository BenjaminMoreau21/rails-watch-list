Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:create]
  end
  delete "bookmarks/:id", to: "bookmarks#destroy", as: "bookmark"
end
