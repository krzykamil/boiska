class ChangeCourtAreaTypeToInteger < ActiveRecord::Migration[5.1]
  def change
    connection.execute(%q{
      alter table courts
      alter column area
      type integer using cast(area as integer)
    })
  end
end
