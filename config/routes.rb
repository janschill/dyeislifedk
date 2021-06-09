# frozen_string_literal: true

Rails.application.routes.draw do
  get "/tournaments", to: "tournaments#index"
  root 'home#index'
end
