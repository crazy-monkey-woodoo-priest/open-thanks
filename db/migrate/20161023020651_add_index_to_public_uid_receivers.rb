class AddIndexToPublicUidReceivers < ActiveRecord::Migration[5.0]
  def change
    add_index :receivers, :public_uid
  end
end
