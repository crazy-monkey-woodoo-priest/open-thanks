class CreateReceivers < ActiveRecord::Migration[5.0]
  def change
    create_table :receivers do |t|
      t.string :title
      t.text :description
      t.text :url
      t.string :public_uid

      t.timestamps
    end
  end
end
