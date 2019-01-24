describe CreateReservation do
  subject { described_class }

  # creating school reservations is tested in create_court_spec

  context 'When reservation is not school reservatio' do
    let(:court) { create(:court) }
    let(:user) { create(:user) }
    let(:reservation_params) do
      {
        school: false,
        time_from: DateTime.strptime('2019-01-01 12:00', '%Y-%m-%d %H:%M'),
        time_to: DateTime.strptime('2019-01-01 14:00', '%Y-%m-%d %H:%M'),
        court_id: court.id,
        user: user
      }
    end
    it 'creates one reservation with given params' do
      subject.new(reservation_params).process
      expect(Reservation.count).to eq 1
      expect(Reservation.last.time_to.hour).to eq 14
      expect(Reservation.last.user_id).to eq user.id
    end
  end
end
