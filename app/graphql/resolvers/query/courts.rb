# frozen_string_literal: true

class Resolvers::Query::Courts < Resolvers::BaseResolver
  type Types::CourtType, null: true

  argument :district, String, required: false
  argument :school, String, required: false
  argument :subsoil_type, String, required: false
  argument :date_available, String, required: false

  def resolve(**args)
    court = Court.all
    court = court.where(district: args[:district]) if args[:district].present?
    court = court.where('school LIKE ?', "%#{args[:school]}%") if args[:school].present?
    court = court.where(subsoil_type: args[:subsoil_type]) if args[:subsoil_type].present?
    court
  end
end
