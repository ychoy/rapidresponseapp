class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :direct_message, :boolean, default:false
  end
end
