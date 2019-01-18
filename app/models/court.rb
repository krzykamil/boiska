class Court < ApplicationRecord
  has_many :reservations
  belongs_to :administrator, class_name: "User"
  belongs_to :supervisor, class_name: "User"
  enum subsoil_type: {
    grass: 0,
    concrete: 1,
    tartan: 2
  }
end
