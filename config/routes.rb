# frozen_string_literal: true

Rails.application.routes.draw do
  root 'app#index'

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  devise_for :users

  match '*path', to: 'app#index', via: :all
end
