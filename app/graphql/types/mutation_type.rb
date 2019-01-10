module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'

    field :createUser, [Types::UserType], null: true do
      argument :name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true
      argument :phone, String, required: true
    end

    def create_user(**_args)
      user = User.create(
        name: _args[:name],
        email: _args[:email],
        password: _args[:password],
        password_confirmation: _args[:password_confirmation],
        phone: _args[:phone]
      )
      [user]
    end
  end
end
