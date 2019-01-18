class AddUsersReferencesToCourt < ActiveRecord::Migration[5.1]
  def change
    add_column :courts, :administrator_id, :integer
    add_column :courts, :supervisor_id, :integer
  end
end
