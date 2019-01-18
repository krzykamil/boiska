module Types
  class CourtType < Types::BaseObject
    graphql_name "Court"
    field :id, ID, null: false
    field :school, String, null: false
    field :width, Int, null: false
    field :length, Int, null: false
    field :subsoil_type, String, null: false
    field :district, String, null: false
    field :open_from, String, null: false
    field :open_to, String, null: false

    def open_from
      object.open_from.strftime('%H:%M')
    end

    def open_to
      object.open_to.strftime('%H:%M')
    end
  end
end
