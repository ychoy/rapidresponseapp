class CreateUserExpertisesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_expertises do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :expertise, foreign_key: true

      t.timestamps
    end
  end
end
