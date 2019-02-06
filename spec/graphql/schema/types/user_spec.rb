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

  describe 'users' do
    context 'create user' do
      let!(:variables) do
        {
          name: 'Ludwig The Acursed',
          email: 'ludwigthb@blood.borne',
          password: 'theholychurch',
          password_confirmation: 'theholychurch',
          phone: '666111222'
        }
      end
      let!(:query_string) do
        <<-GraphQL
      mutation($name: String!, $email: String!, $password: String!, $password_confirmation: String!, $phone: String!){
        createUser(
          signupData: {
            name: $name
            email: $email
            password: $password
            passwordConfirmation: $password_confirmation
            phone: $phone
          }
          ) {
          id
          name
          email
          phone
        }
      }
        GraphQL
      end
      it 'takes in parameters, creates user based on it' do
        user_created = result['data']['createUser']
        expect(user_created).to eq(
          'name' => 'Ludwig The Acursed',
          'email' => 'ludwigthb@blood.borne',
          'id' => User.last.id.to_s,
          'phone' => '666111222'
        )
      end
    end
  end
end
