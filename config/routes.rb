Rails.application.routes.draw do
  scope module: 'admin' do
    resources :sessions, only: %i[new create show destroy]
  end
  namespace :admin do
    resources :users
  end
  resources :users

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
