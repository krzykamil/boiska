class Resolvers::Courts < GraphQL::Function
  argument :district, types.String
  argument :school, types.String
  argument :minimalArea, types.Int
  argument :maximalArea, types.Int
  argument :subsoilType, types.String
  argument :dateAvailable, types.String

  type Types::CourtType

  def call(_obj, args, _ctx)
    court = Court.all
    court = court.where(district: args[:district]) if args[:district].present?
    court = court.where("school LIKE ?", "%#{args[:school]}%") if args[:school].present?
    court = court.where("area >= ?", args[:minimalArea]) if args[:minimalArea].present?
    court = court.where("area <= ?", args[:maximalArea]) if args[:maximalArea].present?
    court = court.where(subsoil_type: args[:subsoilType]) if args[:subsoilType].present?
    court
  end
end
