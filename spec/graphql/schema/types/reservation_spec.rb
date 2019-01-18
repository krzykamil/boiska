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

  describe 'reservations' do
    let(:query_string) do
      <<-GraphQL
    query {
      reservations() {
        id
      }
    }
      GraphQL
    end
    context 'find reservations' do
      let!(:reservation_1) { create(:reservation) }
      it 'searches, and finds one reservation' do
        reservations_found = result['data']['reservations']
        expect(reservations_found).to be_present
        expect(reservations_found.count).to eq 1
      end
    end
    context 'when passing variables it finds me the best results' do
      let!(:court_1) { create(:court, district: 'Nowe Miasto') }
      let!(:reservation_1) { create(:reservation) }
      let!(:reservation_2) { create(:reservation, court: court_1) }
      let!(:variables) { { district: 'Jaroszówka' } }
      let!(:query_string) do
        <<-GraphQL
      query($district: String){
        reservations(district: $district) {
    		  timeFrom
          court {
            district
          }
    		}
      }
        GraphQL
      end
      it 'find one good reservation' do
        reservations_found = result['data']['reservations']
        expect(reservations_found[0]).to eq(
          'timeFrom' => '2019-01-16 13:58:56 UTC',
          'court' => { 'district' => 'Jaroszówka' }
        )
        expect(reservations_found.count).to eq 1
      end
    end
  end
end
