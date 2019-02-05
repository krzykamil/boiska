# frozen_string_literal: true

class Resolvers::Query::Courts < Resolvers::BaseResolver
  type Types::CourtType, null: true

  argument :district, String, required: false
  argument :school, String, required: false
  argument :subsoil_type, String, required: false
  argument :date, String, required: false

  def resolve(**args)
    Searches::CourtSearch.new(args).search
  end
end
