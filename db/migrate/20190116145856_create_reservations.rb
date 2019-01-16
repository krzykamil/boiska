class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :time_from
      t.datetime :time_to
      t.references :user, foreign_key: { on_delete: :cascade }
      t.references :court, foreign_key: { on_delete: :cascade }
      t.boolean :school_reservation

      t.timestamps
    end
  end
end
