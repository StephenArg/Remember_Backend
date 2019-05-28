class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.date :date_created
      t.text :content
      t.references :user, foreign_key: true
    end
  end
end
