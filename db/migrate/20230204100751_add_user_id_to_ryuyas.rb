class AddUserIdToRyuyas < ActiveRecord::Migration[6.1]
  def change
    add_column :ryuyas, :user_id, :integer
  end
end
