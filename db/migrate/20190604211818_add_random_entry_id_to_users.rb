class AddRandomEntryIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :random_entry_id, :integer
  end
end
