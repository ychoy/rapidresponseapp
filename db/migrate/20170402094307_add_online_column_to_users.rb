class AddOnlineColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :online?, :boolean
  end
end
