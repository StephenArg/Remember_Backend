class ChangeUsersRandomEntryIdFromStringToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :random_entry_id
  end
end
