class CreateReservation
  def initialize(reservation_params)
    @day = reservation_params[:day]
    @reservation_params = reservation_params
  end

  def process
    if reservation_params[:school]
      Reservation.create!(school_reservation: true, court_id: reservation_params[:court_id],
                          time_from: time(day, 'start'), time_to: time(day, 'end'), user: reservation_params[:user])
    else
      Reservation.create!(school_reservation: false, court_id: reservation_params[:court_id],
                          time_from: reservation_params[:time_from], time_to: reservation_params[:time_to], user: reservation_params[:user])
    end
  end

  private

  attr_accessor :day, :reservation_params

  def time(day, time)
    params = reservations_attributes.merge(reservation_params)
    DateTime.strptime("2000-01-#{params[day.to_sym][:day_number]} #{params[day.to_sym][time.to_sym]}", '%Y-%m-%d %H:%M')
  end

  def reservations_attributes
    {
      monday: {
        day_number: 3,
        start: '08:00',
        end: '16:00'
      },
      tuesday: {
        day_number: 4,
        start: '08:00',
        end: '16:00'
      },
      wednesday: {
        day_number: 5,
        start: '08:00',
        end: '16:00'
      },
      thursday: {
        day_number: 6,
        start: '08:00',
        end: '16:00'
      },
      friday: {
        day_number: 7,
        start: '08:00',
        end: '16:00'
      },
      saturday: {
        day_number: 8,
        start: '08:00',
        end: '08:00'
      },
      sunday: {
        day_number: 9,
        start: '08:00',
        end: '08:00'
      }
    }
  end
end
