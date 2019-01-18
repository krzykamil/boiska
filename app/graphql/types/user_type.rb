module Types
  class UserType < Types::BaseObject
    graphql_name 'User'
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :password, String, null: false
    field :phone, String, null: false
  end
end
