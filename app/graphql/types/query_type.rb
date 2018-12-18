module Types
  class QueryType < Types::BaseObject
    field :courts, [Types::CourtType], null: true, resolver: Resolvers::Query::Courts
  end
end
