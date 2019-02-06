module Types
  class AuthProviderSignupData < Types::BaseInputObject
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :phone, String, required: true
  end
end
