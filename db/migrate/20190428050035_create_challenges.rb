class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.references :user, foreign_key: true
      t.string :format
      t.string :name

      t.timestamps
    end
  end
end
