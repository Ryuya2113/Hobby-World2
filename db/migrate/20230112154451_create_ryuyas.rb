class CreateRyuyas < ActiveRecord::Migration[6.1]
  def change
    create_table :ryuyas do |t|
      t.string :hobby_name
      t.string :genre
      t.integer :price
      t.text :about
      t.string :spot

      t.timestamps
    end
  end
end
