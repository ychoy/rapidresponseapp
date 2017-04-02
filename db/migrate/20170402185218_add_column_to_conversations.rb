class AddColumnToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :title, :string
  end
end
