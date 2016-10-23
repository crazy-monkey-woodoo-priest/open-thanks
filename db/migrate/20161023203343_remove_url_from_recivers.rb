class RemoveUrlFromRecivers < ActiveRecord::Migration[5.0]
  def change
    remove_column :receivers, :url, :text
  end
end
