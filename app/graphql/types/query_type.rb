module Types
  class QueryType < Types::BaseObject
    field :courts, [Types::CourtType], null: true do
      argument :district, String, required: false
      argument :school, String, required: false
      argument :minimal_area, String, required: false
      argument :subsoil_type, String, required: false
      argument :date_avaible, String, required: false
    end

    def courts(**_args)
      court = Court.all
      court = Court.where(district: _args[:district]) if _args[:district].present?
      court = Court.where(school: _args[:school]) if _args[:school].present?
      court = Court.where(minimal_area: _args[:minimal_area]) if _args[:minimal_area].present?
      court = Court.where(subsoil_type: _args[:subsoil_type]) if _args[:subsoil_type].present?
      court = Court.where(date_avaible: _args[:date_avaible]) if _args[:date_avaible].present?
      court
    end
  end
end
