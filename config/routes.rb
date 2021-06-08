Rails.application.routes.draw do
  get "/tournaments", to: "tournaments#index"
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
