Rails.application.routes.draw do
  root to: "home#index"
  resources :transactions
end
