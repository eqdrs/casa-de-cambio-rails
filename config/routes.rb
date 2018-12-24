Rails.application.routes.draw do
  root to: "home#index"
  resources :transactions, :users
  match "*path", to: "home#catch_404", via: :all
end
