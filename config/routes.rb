# frozen_string_literal: true

Rails.application.routes.draw do
  get "/rules", to: "rules#index"
  get "/tournaments", to: "tournaments#index"
  root 'home#index'
end
