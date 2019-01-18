class Court < ApplicationRecord
  has_many :reservations
  enum subsoil_type: {
    grass: 0,
    concrete: 1,
    tartan: 2
  }
end
