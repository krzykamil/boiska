class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :court
  scope :school_reservations, -> { where(school_reservation: true) }
  scope :people_reservations, -> { where(school_reservation: false) }
  def week_day
    time_from.wday
  end
end
