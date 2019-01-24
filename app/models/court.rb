class Court < ApplicationRecord
  has_many :reservations
  belongs_to :administrator, class_name: "User"
  belongs_to :supervisor, class_name: "User"
  enum subsoil_type: {
    grass: 0,
    concrete: 1,
    tartan: 2
  }

  def available_at?(date)
    return false if reservations.school_reservations.where(["(EXTRACT(day FROM time_from) = :day
      AND (EXTRACT(hour FROM time_from) < :hour OR (EXTRACT(hour FROM time_from) = :hour AND EXTRACT(min FROM time_from) < :minute))
      AND (EXTRACT(hour FROM time_to) > :hour OR (EXTRACT(hour FROM time_to) = :hour AND EXTRACT(min FROM time_to) > :minute)))",
      { day: date.wday+2, hour: date.hour, minute: date.min }]).present?
    return false if reservations.people_reservations.where("? BETWEEN time_from AND time_to", date).present?
    true
  end
end
