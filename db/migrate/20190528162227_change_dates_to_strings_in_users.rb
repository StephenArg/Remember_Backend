class ChangeDatesToStringsInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :current_date, :string
    change_column :users, :random_date, :string
  end
end
