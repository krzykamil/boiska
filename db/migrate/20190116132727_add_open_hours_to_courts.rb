class AddOpenHoursToCourts < ActiveRecord::Migration[5.1]
  def change
    add_column :courts, :open_from, :datetime
    add_column :courts, :open_to, :datetime
  end
end
