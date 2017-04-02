class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :prefix
      t.string :email
      t.string :password_digest
      t.string :title
      t.string :company
      t.string :address
      t.string :biography
      t.boolean :helping
      t.boolean :under_18?
      t.boolean :in_danger?
      t.boolean :in_contact_ICE_24_hours?

      t.timestamps
    end
  end
end
