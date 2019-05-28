class ChangeDateToStringInEntries < ActiveRecord::Migration[5.2]
  def change
    change_column :entries, :date_created, :string
  end
end
