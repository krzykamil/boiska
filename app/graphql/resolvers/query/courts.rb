# frozen_string_literal: true

class Resolvers::Query::Courts < Resolvers::BaseResolver
  type Types::CourtType, null: true

  argument :district, String, required: false
  argument :school, String, required: false
  argument :subsoil_type, String, required: false
  argument :date_available, String, required: false

  def resolve(**args)
    courts = Court.all
    courts = courts.where(district: args[:district]) if args[:district].present?
    courts = courts.where('school LIKE ?', "%#{args[:school]}%") if args[:school].present?
    courts = courts.where(subsoil_type: args[:subsoil_type]) if args[:subsoil_type].present?
    courts
  end
end
