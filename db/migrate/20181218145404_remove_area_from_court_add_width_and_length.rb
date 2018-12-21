class RemoveAreaFromCourtAddWidthAndLength < ActiveRecord::Migration[5.1]
  def change
    remove_column :courts, :area
    add_column :courts, :width, :integer
    add_column :courts, :length, :integer
  end
end
