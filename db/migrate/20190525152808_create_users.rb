class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, limit: 25
      t.string :password_digest
      t.string :name, limit: 25
      t.date :current_date
      t.date :random_date
    end
    add_index :users, :username, unique: true
  end
end
