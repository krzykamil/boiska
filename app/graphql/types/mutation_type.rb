module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'

    field :createUser, Types::UserType, null: true, resolver: Resolvers::Mutation::CreateUser
    field :signInUser, Types::SignInPayload, null: true, resolver: Resolvers::Mutation::SignInUser
  end
end
