module Types
  class QueryType < Types::BaseObject
    field :courts, [Types::CourtType], null: true, resolver: Resolvers::Query::Courts
    field :reservations, [Types::ReservationType], null: true, resolver: Resolvers::Query::Reservations
  end
end
