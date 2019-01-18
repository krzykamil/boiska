# frozen_string_literal: true

class Resolvers::Query::Reservations < Resolvers::BaseResolver
  type Types::ReservationType, null: true

  argument :phone, String, required: false
  argument :district, String, required: false

  def resolve(**args)
    courts = Searches::CourtSearch.new(args).search
    reservations = Reservation.where(court: courts)

  end
end
