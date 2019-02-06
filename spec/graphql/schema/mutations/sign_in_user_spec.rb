require 'rails_helper'
describe BoiskoDlaMnieSchema do
  let(:context) { {} }
  let(:variables) { {} }
  let(:result) do
    res = described_class.execute(
      query_string,
      context: context,
      variables: variables
    )
    res
  end
  context 'sign in user' do
    let!(:user) { create(:user, email: "mail@gmail.com", password: "haslo", password_confirmation: "haslo") }
    let!(:variables) do
      {
        email: 'mail@gmail.com',
        password: 'haslo'
      }
    end
    let!(:query_string) do
      <<-GraphQL
    mutation($email: String!, $password: String!){
      signInUser(
        email: {
          email: $email
          password: $password
        }
        ) {
          user {
            name
            email
            phone
          }
          token
      }
    }
      GraphQL
    end
    it 'returns user and his authentication token' do
      logged_user = result['data']['signInUser']
      expect(logged_user['user']).to eq(
        'name' => 'Krzysztof',
        'email' => 'mail@gmail.com',
        'phone' => '123654912'
      )
      expect(logged_user['token']).to be_present
    end
  end

end
