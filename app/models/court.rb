class Court < ApplicationRecord
  enum subsoil_type: {
    grass: 0,
    concrete: 1,
    tartan: 2
  }
end
