class ChangeUserDetails < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :in_danger?, :danger?
      t.rename :in_contact_ICE_24_hours?, :contact_ice_24_hours?
    end
  end
end
