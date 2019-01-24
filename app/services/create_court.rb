class CreateCourt
  WEEK = %w[monday tuesday wednesday thursday friday saturday sunday].freeze

  def initialize(court_params, school:, reservation_params: {})
    @court_params = court_params
    @school = school
    @reservation_params = reservation_params
  end

  def process
    @court = Court.create!(court_attributes.merge(court_params))
    if school
      WEEK.each do |day|
        CreateReservation.new(reservations_attributes.merge(reservation_params).merge(day: day, user: court_params[:supervisor])).process
      end
    end
  end

  private

  attr_accessor :court_params, :school, :reservation_params, :court

  def reservations_attributes
    {
      school: true,
      court_id: court.id
    }
  end

  def court_attributes
    {
      open_from: '8:00',
      open_to: '22:00'
    }
  end
end
