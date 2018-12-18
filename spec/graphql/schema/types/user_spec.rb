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
      let!(:court_1) { create(:court) }
      let!(:variables) do
        {
          name: 'Ludwig The Acursed',
          email: 'ludwigthb@blood.borne',
          password: 'theholychurch',
          phone: '666111222'
        }
      end
      let!(:query_string) do
        <<-GraphQL
      mutation($name: String!, $email: String!, $password: String!, $phone: String!){
        createUser(name: $name
        email: $email
        password: $password
        phone: $phone) {
          id
          name
          email
          password
          phone
        }
      }
        GraphQL
      end
      it 'takes in parameters, creates user based on it' do
        users_created = result['data']['createUser']
        expect(users_created[0]).to eq(
          'name' => 'Ludwig The Acursed',
          'email' => 'ludwigthb@blood.borne',
          'id' => '1',
          'password' => 'theholychurch',
          'phone' => '666111222'
        )
        expect(users_created.count).to eq 1
      end
    end
  end
end
