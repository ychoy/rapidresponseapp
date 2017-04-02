class CreateExpertises < ActiveRecord::Migration[5.0]
  def change
    create_table :expertises do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :profession, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
