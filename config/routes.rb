Rails.application.routes.draw do
  root to: "home#index"
  resources :transactions, :users, :addresses
  match "*path", to: "home#catch_404", via: :all
end
