module Types
  class ReservationType < Types::BaseObject
    graphql_name 'Reservation'

    field :id, ID, null: false
    field :time_from, String, null: false
    field :time_to, String, null: false
    field :user, Types::UserType, null: false
    field :court, Types::CourtType, null: false
  end
end
