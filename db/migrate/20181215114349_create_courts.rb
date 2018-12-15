class CreateCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :courts do |t|
      t.string :district
      t.string :school
      t.string :area
      t.integer :subsoil_type
      t.timestamps
    end
  end
end
