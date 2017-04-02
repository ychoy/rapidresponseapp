class AddColumnsToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :direct_message, :boolean, default:false
  end
end
