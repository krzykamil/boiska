describe CreateCourt do
  let(:administrator) { create(:user) }
  let(:supervisor) { create(:user) }
  let(:params) do
    {
      district: 'Wygoda',
      school: 'SP 1',
      subsoil_type: 'grass',
      width: 60,
      length: 100,
      administrator: administrator,
      supervisor: supervisor
    }
  end

  subject { described_class }

  context 'When court is school court' do
    context 'reservation_params are not given' do
      it 'creates court with seven school reservations with default hours' do
        subject.new(params, school: true).process
        expect(Court.count).to eq 1
        expect(Court.last.reservations.count).to eq 7
        expect(Reservation.first.time_from.hour).to eq 8
        expect(Reservation.first.user_id).to eq supervisor.id
        expect(Court.last.supervisor_id). to eq supervisor.id
        expect(Court.last.administrator_id). to eq administrator.id
      end
    end
    context 'some reservation_params are given' do
      let(:reservation_params) do
        {
          monday: {
            day_number: 3,
            start: '10:00',
            end: '16:00'
          }
        }
      end
      it 'creates court with seven school reservations with given hours' do
        subject.new(params, school: true, reservation_params: reservation_params).process
        expect(Court.count).to eq 1
        expect(Court.last.reservations.count).to eq 7
        expect(Reservation.first.time_from.hour).to eq 10
      end
    end
  end
  context 'When court is not school court' do
    it 'creates court without any reservations' do
      subject.new(params, school: false).process
      expect(Court.count).to eq 1
      expect(Court.last.reservations.count).to eq 0
      expect(Court.last.supervisor_id). to eq supervisor.id
      expect(Court.last.administrator_id). to eq administrator.id
    end
  end
end
