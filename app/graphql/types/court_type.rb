module Types
  class CourtType < Types::BaseObject
    graphql_name "Court"
    description 'Dla mnie boiska'
    field :id, ID, null: false
    field :school, String, null: false
    field :width, Int, null: false
    field :length, Int, null: false
    field :subsoil_type, String, null: false
    field :district, String, null: false
  end
end
