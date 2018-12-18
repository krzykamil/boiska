module Types
  class QueryType < Types::BaseObject
    field :courts, [Types::CourtType], null: true, function: Resolvers::Courts.new
  end
end
