module Types
  class AuthProviderEmailInput < Types::BaseInputObject
    argument :email, String, required: true
    argument :password, String, required: true
  end
end
