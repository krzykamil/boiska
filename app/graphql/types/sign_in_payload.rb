module Types
  class SignInPayload < Types::BaseObject
    graphql_name 'SignInPayload'

    field :token, String, null: false
    field :user, Types::UserType, null: false
  end
end
