class AddDateRandomChosenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :date_random_chosen, :string
  end
end
