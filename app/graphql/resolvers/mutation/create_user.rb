class Resolvers::Mutation::CreateUser < Resolvers::BaseResolver
  type Types::UserType, null: true

  argument :signupData, Types::AuthProviderSignupData, required: true

  def resolve(**args)
    user = User.create!(
      name: args[:signup_data][:name],
      email: args[:signup_data][:email],
      password: args[:signup_data][:password],
      password_confirmation: args[:signup_data][:password_confirmation],
      phone: args[:signup_data][:phone]
    )
    user
  end
end
