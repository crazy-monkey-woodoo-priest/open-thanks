class CreateAppreciations < ActiveRecord::Migration[5.0]
  def change
    create_table :appreciations do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.string  :public_uid

      t.timestamps
    end
  end
end
