class Resolvers::Mutation::SignInUser < Resolvers::BaseResolver
  type Types::SignInPayload, null: true

  argument :email, Types::AuthProviderEmailInput, required: true

  def resolve(**args)
    input = args[:email]

    return unless input

    user = User.find_by(email: input[:email])

    return unless user && user.authenticate(input[:password])

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")
    context[:session][:token] = token
    {
      user: user,
      token: token
    }
  end

end
