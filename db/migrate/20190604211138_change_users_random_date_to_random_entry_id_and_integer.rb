class ChangeUsersRandomDateToRandomEntryIdAndInteger < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :random_date, :random_entry_id
  end
end
