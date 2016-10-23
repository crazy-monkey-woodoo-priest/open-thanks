class AddUserIdToReceivers < ActiveRecord::Migration[5.0]
  def change
    add_column :receivers, :user_id, :integer
  end
end
