class AddIndexToPublicUidAppreciations < ActiveRecord::Migration[5.0]
  def change
    add_index :appreciations, :public_uid
  end
end
