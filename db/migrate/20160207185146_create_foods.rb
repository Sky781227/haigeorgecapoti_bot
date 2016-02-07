class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :user_id
      t.string :url

      t.timestamps null: false
    end
  end
end
