class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :public_uid

      t.timestamps
    end
    add_index :users, :public_uid
  end
end
