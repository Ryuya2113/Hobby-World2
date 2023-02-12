class AddImageToRyuyas < ActiveRecord::Migration[6.1]
  def change
    add_column :ryuyas, :image, :string
  end
end
