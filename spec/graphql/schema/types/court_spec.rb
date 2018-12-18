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

  describe 'courts' do
    let(:query_string) do
      <<-GraphQL
    query {
      courts() {
        id
      }
    }
      GraphQL
    end
    context 'find courts' do
      let!(:court_1) { create(:court) }
      it 'searches, and finds one court' do
        courts_found = result['data']['courts']
        expect(courts_found).to be_present
        expect(courts_found.count).to eq 1
      end
    end
    context 'when passing variables it finds me the best results' do
      let!(:court_1) { create(:court) }
      let!(:court_2) { create(:court, subsoil_type: 'concrete') }
      let!(:court_3) { create(:court, subsoil_type: 'tartan') }
      let!(:variables) { { district: 'Jaroszówka', school: 'SP', minimalArea: 'm2', subsoilType: 'grass' } }
      let!(:query_string) do
        <<-GraphQL
      query($district: String, $school: String, $minimalArea: String, $subsoilType: String){
        courts(district: $district
        school: $school
        minimalArea: $minimalArea
        subsoilType: $subsoilType) {
          id
          district
          school
          area
          subsoilType
        }
      }
        GraphQL
      end
      it 'find one good school' do
        courts_found = result['data']['courts']
        expect(courts_found[0]).to eq(
          'district' => 'Jaroszówka',
          'school' => 'SP 2',
          'area' => '12m2',
          'subsoilType' => 'grass',
          'id' => court_1.id.to_s
        )
        expect(courts_found.count).to eq 1
      end
    end
  end
end
