class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.references :user, foreign_key: true
      t.integer :format, default: 0
      t.string :name, :null => false

      t.timestamps
    end
    add_index :challenges, [:user_id, :name], unique: true
  end
end
